import { preferences } from "@kit.ArkData";
import { Context } from "@kit.AbilityKit";

const KvName = "MyStore"

export class Kv {
  static save(context: Context, key: string, value: string | number | boolean) {
    preferences.getPreferences(context, KvName, (err, val) => {
      if (err) {
        console.error("Failed to get preferences, code=" + err.code + ",message=" + err.message)
      }
      val.put(key, value)
      val.flush()
    })
  }

  static get(context: Context, key: string):preferences.ValueType {
    let pf = preferences.getPreferencesSync(context, { name: KvName });
    return pf.get(key,undefined);
  }
}
