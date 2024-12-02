import { webview } from '@kit.ArkWeb'
import { router } from '@kit.ArkUI'
import { getStatusBarHeight, TopBar } from '../common/Common'

@Component
@Entry
struct PageWeb {
  private ctl = new webview.WebviewController()
  private url: string = (router.getParams() as Record<string, string>)["url"]
  @State
  private statusBarHeight:number= 0

  aboutToAppear(): void {
    getStatusBarHeight((h) => {
      this.statusBarHeight = h
    })
  }

  build() {
    Column() {
      TopBar({ title: "Web" })
      Web({
        src: this.url,
        controller: this.ctl
      })
    }.width('100%').height('100%').padding({ top: this.statusBarHeight })
  }
}