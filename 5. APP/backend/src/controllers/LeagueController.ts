import {BodyParams, Controller, Delete, Get, Patch, PathParams, Put} from "@tsed/common";
import {ContentType} from "@tsed/schema";
import DB from "../db/DB";
import League from "../models/League";

@Controller("/league")

export class LeagueController {

  @Get("/")
  @ContentType("json")
  async getAll() {
    const result = await DB.query(
      `SELECT *
       FROM league`);
    return result.rows;
  }

  @Get("/:id")
  @ContentType("json")
  async get(
    @PathParams("id") id: string
  ) {
    const result = await DB.query(
      `SELECT *
       FROM league
       WHERE id = $1`, [id]);
    return result.rows[0];
  }

  @Put("/")
  @ContentType("json")
  async insert(@BodyParams() league: League) {
    await DB.query(
      `INSERT INTO league (level, gender)
       VALUES ($1, $2)`,
      [league.level, league.gender]
    );
    return league; // TODO: send full object
  }

  @Patch("/:id")
  @ContentType("json")
  async update(
    @PathParams("id") id: string,
    @BodyParams() league: League
  ) {
    await DB.query(
      `UPDATE league
       SET level  = $1,
           gender = $2
       WHERE id = $3`,
      [league.level, league.gender, id]
    );
  }

  @Delete("/:id")
  @ContentType("json")
  async delete(
    @PathParams("id") id: string
  ) {
    const results = await DB.query(
      `DELETE
       FROM league
       WHERE id = $1`,
      [id]
    );
    return results.rows;
  }

  //TODO DELETE
}

