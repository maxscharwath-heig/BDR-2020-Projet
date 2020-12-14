import {BodyParams, Controller, Delete, Get, PathParams, Put} from "@tsed/common";
import {ContentType} from "@tsed/schema";
import DB from "../db/DB";
import Sport from "../models/Sport";
import {NotFound} from "@tsed/exceptions";

@Controller("/sport")
export class SportController {

  @Get("/")
  @ContentType("json")
  async getAll() {
    const result = await DB.query(`SELECT * FROM sport`);
    return result.rows.map(r => Sport.hydrate(r));
  }

  @Get("/:id")
  @ContentType("json")
  async get(@PathParams("id") id: number) {
    const query = await DB.query(`SELECT * FROM sport WHERE id = $1`, [id]);
    const result = query.rows.map(r => Sport.hydrate(r))[0];
    if (result) return result;
    throw new NotFound("Sport not found");
  }

  @Put("/")
  @ContentType("json")
  async put(@BodyParams() sport: Sport) {
    const result = await DB.query(`INSERT INTO sport(name) VALUES ($1)`, [sport.name]);
  }

  @Delete("/:id")
  @ContentType("json")
  async delete(@PathParams("id") id: number) {
    const result = await DB.query(`DELETE FROM sport WHERE id = $1`, [id]);
  }
}
