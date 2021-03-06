import {
  BodyParams,
  Controller,
  Delete,
  Get,
  MultipartFile,
  Patch,
  PathParams,
  PlatformMulterFile,
  Post,
  Put,
  QueryParams,
  Req,
  UseBefore
} from "@tsed/common";
import {ContentType} from "@tsed/schema";
import DB, {PoolClient} from "../../db/DB";
import {BadRequest, Unauthorized} from "@tsed/exceptions";
import {Authenticate} from "@tsed/passport";
import Utils from "../../utils/Utils";
import Administrator from "../../models/Administrator";
import Team from "../../models/Team";
import Paginator from "../../utils/Paginator";
import {RouteLogMiddleware} from "../../middlewares/RouteLogMiddleware";
import Jimp from "jimp";
import {rootDir} from "../../Server";
import fs from "fs";

/**
 * Manage team related to user
 */
@Controller("/team")
@Authenticate()
@UseBefore(RouteLogMiddleware)
export class MyTeamController {

  /**
   * Retrieve all accessible teams of user
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
    @QueryParams("offset")offset: number = 0) {

    const perms = await Utils.getAccessibleClubResources(<Administrator>request.user);
    return new Paginator(Team)
      .setTotalQuery(`
          SELECT count(*)
          FROM team t
                   INNER JOIN club c on t.clubid = c.id
          WHERE c.id = ANY ($1)
            AND t.name ILIKE $2
            AND t.active = TRUE
      `, [perms])
      .setQuery(`
          SELECT t.*, row_to_json(c.*) as club, row_to_json(l.*) as league
          FROM team t
                   INNER JOIN club c on t.clubid = c.id
                   INNER JOIN league l on t.leagueid = l.id
          WHERE c.id = ANY ($1)
            AND t.name ILIKE $2
            AND t.active = TRUE
          ORDER BY name
      `, [perms])
      .create({query, limit, offset});
  }

  /**
   * Create new team
   * @param request
   * @param team
   */
  @Put("/")
  @ContentType("json")
  async put(@Req() request: Req, @BodyParams() team: Team) {

    if (!await Utils.checkAccessToClubResource(<Administrator>request.user, team.club.id)) throw new Unauthorized("Unauthorized ressource");
    if (!await Utils.validationSportClubLeague(team.club.id, team.league.id)) throw new BadRequest("Wrong Sport");

    const result = await DB.query(`INSERT INTO team(name, clubid, leagueid)
                                   VALUES ($1, $2, $3)
                                   RETURNING *`, [team.name, team.club.id, team.league.id]);

    return result.rows.map((r) => Team.hydrate<Team>(r))[0];
  }

  /**
   * Update team
   * @param request
   * @param id
   * @param team
   */
  @Patch("/:id")
  @ContentType("json")
  async patch(@Req() request: Req, @PathParams("id") id: number, @BodyParams() team: Team) {
    if (!await Utils.checkAccessToClubResource(<Administrator>request.user, team.club.id)) throw new Unauthorized("Unauthorized ressource");
    if (!await Utils.validationSportClubLeague(team.club.id, team.league.id)) throw new BadRequest("Wrong Sport");

    const result = await DB.query(`UPDATE team
                                   SET name     = $1,
                                       clubid   = $2,
                                       leagueid = $3
                                   WHERE id = $4
                                   RETURNING *`, [team.name, team.club.id, team.league.id, id]);

    return result.rows.map((r) => Team.hydrate<Team>(r))[0];
  }

  /**
   * Delete team
   * @param request
   * @param id
   */
  @Delete("/:id")
  @ContentType("json")
  async deleteTeam(@Req() request: Req, @PathParams("id") id: number) {
    if (!await Utils.checkAccessToTeamResource(<Administrator>request.user, id)) throw new Unauthorized("Unauthorized ressource");

    const client = await PoolClient();
    try {
      await client.query("BEGIN");


      await client.query(`UPDATE player_play_for_team
                          SET endat = COALESCE(endat, NOW())
                          WHERE teamid = $1`, [id]);

      await client.query(`UPDATE team
                          SET active = FALSE
                          WHERE id = $1`, [id]);

      await client.query("COMMIT");

    } catch (e) {
      await client.query("ROLLBACK");
      throw e;
    } finally {
      client.release();
    }
  }

  /**
   * Add player to team
   * @param request
   * @param id
   * @param data
   */
  @Put("/:id/player")
  @ContentType("json")
  async addPlayer(@Req() request: Req, @PathParams("id") id: number, @BodyParams() data: any) {

    if (!await Utils.checkAccessToTeamResource(<Administrator>request.user, id)) throw new Unauthorized("Unauthorized ressource");

    await DB.query(`INSERT INTO player_play_for_team(playeruid, teamid, jerseynumber)
                    VALUES ($1, $2, $3)`, [data.playerUid, id, data.jerseyNumber]);
  }

  /*
  @Patch("/:id/player")
  @ContentType("json")
  async updatePlayer(@Req() request: Req, @PathParams("id") id: number, @BodyParams() data: any) {

    if (!await Utils.checkAccessToTeamResource(<Administrator>request.user, id)) throw new Unauthorized("Unauthorized ressource");

    await DB.query(`UPDATE player_play_for_team
                    SET jerseynumber = $1
                    WHERE playeruid = $2
                      AND teamid = $3 `, [data.jerseyNumber, data.playerUid, id]);
  }
*/

  /**
   * Remove player from team
   * @param request
   * @param id
   * @param data
   */
  @Delete("/:id/player")
  @ContentType("json")
  async deletePlayer(@Req() request: Req, @PathParams("id") id: number, @BodyParams() data: any) {

    if (!await Utils.checkAccessToTeamResource(<Administrator>request.user, id)) throw new Unauthorized("Unauthorized ressource");

    await DB.query(`UPDATE player_play_for_team
                    SET endat        = current_timestamp,
                        jerseynumber = NULL
                    WHERE playeruid = $1
                      AND teamid = $2 `, [data.playerUid, id]);

    if (fs.existsSync(`${rootDir}/storage/team/${id}.png`)) {
      fs.unlinkSync(`${rootDir}/storage/team/${id}.png`);
    }
  }

  /**
   * Edit & upload team's picture
   * @param request
   * @param id
   * @param file
   * @private
   */
  @Post("/:id/avatar")
  private async uploadFile(@Req() request: Req, @PathParams("id") id: number, @MultipartFile("file") file: PlatformMulterFile) {
    if (!await Utils.checkAccessToTeamResource(<Administrator>request.user, id)) throw new Unauthorized("Unauthorized Resource");
    try {
      const img = await Jimp.read(file.path);
      img
        .contain(500, 500)
        .quality(75)
        .write(`${rootDir}/storage/team/${id}.png`);
    } finally {
      fs.unlinkSync(file.path);
    }
    return true;
  }
}
