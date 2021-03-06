import {BodyParams, Controller, Delete, Get, PathParams, Put, QueryParams, UseBefore} from "@tsed/common";
import {ContentType} from "@tsed/schema";
import DB from "../../db/DB";
import Sport from "../../models/Sport";
import {NotFound} from "@tsed/exceptions";
import {Authenticate} from "@tsed/passport";
import {RouteLogMiddleware} from "../../middlewares/RouteLogMiddleware";
import Paginator from "../../utils/Paginator";

/**
 * Public sport endpoint
 */
@Controller("/sport")
@UseBefore(RouteLogMiddleware)
@Authenticate()
export class SportController {

  /**
   * Retrieve all sports
   * @param query
   * @param limit
   * @param offset
   */
  @Get("/")
  @ContentType("json")
  async getAll(
    @QueryParams("q")query: string = "",
    @QueryParams("limit")limit: number = 20,
    @QueryParams("offset")offset: number = 0
  ) {
    const page = new Paginator(Sport)
      .setTotalQuery(`
          SELECT count(*)
          FROM sport
          WHERE name ILIKE $1
      `)
      .setQuery(`
          SELECT *
          FROM sport
          WHERE name ILIKE $1
          ORDER BY name
      `)
      .create({query, limit, offset});
    return JSON.stringify(await page);
  }

  /**
   * Retrieve a sport
   * @param id
   */
  @Get("/:id")
  @ContentType("json")
  async get(@PathParams("id") id: number) {
    const query = await DB.query(`SELECT *
                                  FROM sport
                                  WHERE id = $1`, [id]);
    const result = query.rows.map(r => Sport.hydrate<Sport>(r))[0];
    if (result) return result;
    throw new NotFound("Sport not found");
  }

  /**
   * Create Sport
   * @param sport
   * (not used yet)
   */
  @Put("/")
  @ContentType("json")
  async put(@BodyParams() sport: Sport) {
    const result = await DB.query(`INSERT INTO sport(name)
                                   VALUES ($1)
                                   RETURNING *`, [sport.name]);

    return result.rows.map((r) => Sport.hydrate<Sport>(r))[0];
  }

  /**
   * Delete sport
   * @param id
   * (not used yet)
   */
  @Delete("/:id")
  @ContentType("json")
  async delete(@PathParams("id") id: number) {
    await DB.query(`DELETE
                    FROM sport
                    WHERE id = $1`, [id]);
  }
}
