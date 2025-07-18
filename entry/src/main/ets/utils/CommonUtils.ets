import { window } from '@kit.ArkUI'
import { common } from '@kit.AbilityKit';

export async function changeStatusBarColor(context:common.BaseContext , statusBarColor: string, statusBarContentColor: string = "#000000") {
  try {
    const  windowClass = await window.getLastWindow(context)
    // const windowClass = await window.getLastWindow(context)
    await windowClass.setWindowSystemBarProperties({
      statusBarColor: statusBarColor,
      statusBarContentColor: statusBarContentColor
    })
  } catch (e) {
    console.error("Failed to change status bar color", e)
  }
}