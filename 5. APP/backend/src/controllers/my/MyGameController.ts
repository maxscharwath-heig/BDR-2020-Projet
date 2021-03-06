import {BodyParams, Controller, Delete, Get, Patch, PathParams, Put, QueryParams, Req, UseBefore} from "@tsed/common";
import {ContentType} from "@tsed/schema";
import DB, {PoolClient} from "../../db/DB";
import {BadRequest, Unauthorized} from "@tsed/exceptions";
import Game from "../../models/Game";
import {Authenticate} from "@tsed/passport";
import Paginator from "../../utils/Paginator";
import Utils from "../../utils/Utils";
import Administrator from "../../models/Administrator";
import {RouteLogMiddleware} from "../../middlewares/RouteLogMiddleware";

/**
 * Manage game related to user
 */
@Controller("/game")
@UseBefore(RouteLogMiddleware)
@Authenticate()
export class MyGameController {

  /**
   * Retrieve all accessible games of user
   * @param request
   * @param query
   * @param limit
   * @param offset
   */
  @Get("/")
  @ContentType("json")
  async getAll(
    @Req() request: Req,
    @QueryParams("q")query: string = "",
    @QueryParams("limit")limit: number = 20,
    @QueryParams("offset")offset: number = 0
  ) {
    const perms = await Utils.getAccessibleGameResources(<Administrator>request.user);
    return new Paginator(Game)
      .setTotalQuery(`
          SELECT count(*)
          FROM event_game
          WHERE uid = ANY ($1)
            AND name ILIKE $2
      `, [perms])
      .setQuery(`
          SELECT g.*,
                 row_to_json(s.*)  as stadium,
                 row_to_json(th.*) as teamHome,
                 row_to_json(tg.*) as teamGuest,
                 row_to_json(c.*)  as championship
          FROM event_game g
                   INNER JOIN stadium s ON s.id = g.stadiumid
                   INNER JOIN team th ON th.id = g.teamhomeid
                   INNER JOIN team tg ON tg.id = g.teamguestid
                   INNER JOIN championship c ON c.id = g.championshipid
          WHERE g.uid = ANY ($1)
            AND g.name ILIKE $2
          ORDER BY g.startat DESC
      `, [perms])
      .create({query, limit, offset});
  }

  /**
   * Create new game
   * @param request
   * @param game
   */
  @Put("/")
  @ContentType("json")
  async putGame(@Req() request: Req, @BodyParams() game: Game) {
    if (!await Utils.checkAccessToChampionshipResource(<Administrator>request.user, game.championship.id)) throw new Unauthorized("Unauthorized Resource");
    if (!await Utils.validationGame(game.championship.id, game.teamHome.id, game.teamGuest.id)) throw new BadRequest("Selected teams are not both playing in this league");

    const client = await PoolClient();
    try {
      await client.query("BEGIN");
      const res1 = await client.query(
        `INSERT INTO event (name, startat, endat, stadiumid)
         VALUES ($1, $2, $3, $4)
         RETURNING *`, [game.name, game.startAt, game.endAt, game.stadium.id]);

      const res2 = await client.query(`INSERT INTO game (eventuid, gameid, championshipid, teamhomeid, teamguestid)
                                       VALUES ($1, $2, $3, $4, $5)`, [res1.rows[0].uid, game.gameId, game.championship.id, game.teamHome.id, game.teamGuest.id]);

      await client.query("COMMIT");

      return res2.rows.map(r => Game.hydrate<Game>(r))[0];

    } catch (e) {
      await client.query("ROLLBACK");
      throw e;
    } finally {
      client.release();
    }
  }

  /**
   * Update game
   * @param request
   * @param uid
   * @param game
   */
  @Patch("/:uid")
  @ContentType("json")
  async patch(@Req() request: Req, @PathParams("uid") uid: string, @BodyParams() game: Game) {
    if (!await Utils.checkAccessToGameResource(<Administrator>request.user, uid)) throw new Unauthorized("Unauthorized ressource");
    if (!await Utils.validationGame(game.championship.id, game.teamHome.id, game.teamGuest.id)) throw new BadRequest("Selected teams are not both playing in this league");

    const client = await PoolClient();
    try {
      await client.query("BEGIN");
      const res1 = await client.query(
        `UPDATE event
         SET name      = $1,
             startat   = $2,
             endat     = $3,
             stadiumid = $4
         WHERE uid = $5
         RETURNING *`, [game.name, game.startAt, game.endAt, game.stadium.id, uid]);

      const res2 = await client.query(`UPDATE game
                                       SET gameid         = $1,
                                           championshipid = $2,
                                           teamhomeid     = $3,
                                           teamguestid    = $4,
                                           scoreguest     = $5,
                                           scorehome      = $6,
                                           canceled       = $7
                                       WHERE eventuid = $8
                                       RETURNING *`, [game.gameId, game.championship.id, game.teamHome.id, game.teamGuest.id, game.scoreGuest, game.scoreHome, game.canceled, uid]);

      await client.query("COMMIT");

      return res2.rows.map(r => Game.hydrate<Game>(r))[0];

    } catch (e) {
      await client.query("ROLLBACK");
      throw e;
    } finally {
      client.release();
    }
  }

  /**
   * Delete game
   * @param request
   * @param uid
   */
  @Delete("/:uid")
  @ContentType("json")
  async delete(@Req() request: Req, @PathParams("uid") uid: string) {
    if (!await Utils.checkAccessToGameResource(<Administrator>request.user, uid)) throw new Unauthorized("Unauthorized ressource");

    await DB.query(`DELETE
                    FROM event
                    WHERE uid = $1`, [uid]);
  }
}

