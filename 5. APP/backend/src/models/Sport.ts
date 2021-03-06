import {Property} from "@tsed/schema";
import Model, {Hydrator} from "./Model";

export default class Sport extends Model {
  @Hydrator()
  @Property()
  id: number;

  @Hydrator()
  @Property()
  name: string;
}
