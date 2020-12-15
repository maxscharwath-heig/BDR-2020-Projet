import {BodyParams, Controller, Delete, Get, Patch, PathParams, Put} from "@tsed/common";
import {ContentType} from "@tsed/schema";
import DB from "../db/DB";
import Stadium from "../models/Stadium";
import {NotFound} from "@tsed/exceptions";

@Controller("/stadium")

export class StadiumController {

  @Get("/")
  @ContentType("json")
  async getAll() {
    const result = await DB.query(
      `SELECT *
       FROM stadium`);
    return result.rows.map(r => Stadium.hydrate<Stadium>(r));
  }

  @Get("/:id")
  @ContentType("json")
  async get(
    @PathParams("id") id: string
  ) {
    const query = await DB.query(
      `SELECT *
       FROM stadium
       WHERE id = $1`, [id]);
    const result = query.rows.map(r => Stadium.hydrate<Stadium>(r))[0];
    if (result) return result;
    throw new NotFound("Stadium not found");
  }

  @Put("/")
  @ContentType("json")
  async insert(@BodyParams() stadium: Stadium) {
    await DB.query(
      `INSERT INTO stadium (name, address, capacity)
       VALUES ($1, $2, $3)`,
      [stadium.name, stadium.address, stadium.capacity]
    );
    return stadium; // TODO: send full object
  }

  @Patch("/:id")
  @ContentType("json")
  async update(
    @PathParams("id") id: string,
    @BodyParams() stadium: Stadium
  ) {
    await DB.query(
      `UPDATE stadium
       SET name     = $1,
           address  = $2,
           capacity = $3
       WHERE id = $4`,
      [stadium.name, stadium.address, stadium.capacity, id]
    );
  }

  @Delete("/:id")
  @ContentType("json")
  async delete(
    @PathParams("id") id: string
  ) {
    const results = await DB.query(
      `DELETE
       FROM stadium
       WHERE id = $1`,
      [id]
    );
    return results.rows;
  }

  //TODO DELETE
}
