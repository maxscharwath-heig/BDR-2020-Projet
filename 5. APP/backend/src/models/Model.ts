import {Property} from "@tsed/schema";

export function Hydrator(options?: {alias?: string, model?: typeof Model}): PropertyDecorator {
  return (target: {} | any, propertyKey: PropertyKey): any => {
    target["__hydrated_props"] = [...target["__hydrated_props"] ?? [], [propertyKey, options?.alias, options?.model]];
    target[propertyKey] = null;
  };
}

export default class Model {
  @Property()
  __typename: string = this.constructor.name;

  protected __hydrated_props: [name: string, alias?: string, model?: Model][];

  public static hydrate<T extends Model>(data: {[key: string]: any}) {
    return new this().hydrate(data) as T;
  }

  public hydrate(data: {[key: string]: any}) {
    for (const [name, alias, model] of this.__hydrated_props) {
      const n = alias ?? name;
      const d = data[n] ?? data[n.toLowerCase()];
      if (d !== undefined) {
        (this as any)[name] = model ? model.hydrate(d) : d;
      }
    }
    return this;
  }
}
