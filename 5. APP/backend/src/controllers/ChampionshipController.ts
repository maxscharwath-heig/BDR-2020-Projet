import {BodyParams, Controller, Delete, Get, Patch, PathParams, Put} from "@tsed/common";
import {ContentType, Returns} from "@tsed/schema";
import DB from "../db/DB";
import Championship from "../models/Championship";
import {NotFound} from "@tsed/exceptions";

@Controller("/championship")
export class ChampionshipController {

  @Get("/")
  @(Returns(200, Championship).Of(Championship).Description("All Championship"))
  @ContentType("json")
  async getAll() {
    const result = await DB.query(
      `SELECT *
       FROM championship`);
    return result.rows.map(r => Championship.hydrate(r));
  }

  @Get("/:id")
  @ContentType("json")
  async get(
    @PathParams("id") id: string
  ) {
    const query = await DB.query(
      `SELECT *
       FROM championship
       WHERE id = $1`, [id]);

    const result = query.rows.map(r => Championship.hydrate(r))[0];
    if (result) return result;
    throw new NotFound("Championship not found");
  }

  @Put("/")
  @ContentType("json")
  async insert(@BodyParams() championship: Championship) {
    await DB.query(
      `INSERT INTO championship (name, startat, endat)
       VALUES ($1, $2, $3)`,
      [championship.name, championship.startAt, championship.endAt]
    );
    return championship; // TODO: send full object
  }

  @Patch("/:id")
  @ContentType("json")
  async update(
    @PathParams("id") id: string,
    @BodyParams() championship: Championship
  ) {
    await DB.query(
      `UPDATE championship
       SET name    = $1,
           startat = $2,
           endat   = $3
       WHERE id = $4`,
      [championship.name, championship.startAt, championship.endAt, id]
    );
  }

  @Delete("/:id")
  @ContentType("json")
  async delete(
    @PathParams("id") id: string
  ) {
    const results = await DB.query(
      `DELETE
       FROM championship
       WHERE id = $1`,
      [id]
    );
    return results.rows;
  }

}

