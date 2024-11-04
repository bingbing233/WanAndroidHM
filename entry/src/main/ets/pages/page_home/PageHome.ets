import { HomeBanner } from "../../net/module/HomeBanner"
import { PageHomeVM } from "./PageHomeVM"

@ComponentV2
export struct PageHome {
  private vm: PageHomeVM = new PageHomeVM()
  private ctl = new SwiperController()

  aboutToAppear(): void {
    this.vm.getHomeBanner()
  }

  build() {
    Column() {
      Swiper(this.ctl) {
        ForEach(this.vm.homeBanners, (item: HomeBanner) => {
          Image(item.imagePath).width('100%').height(250).onClick(() => {
            // 点击跳转到webview，并且打开链接
          })
        })
      }.loop(true).interval(3000).width('100%').height(250)
    }.width('100%').height('100%')
  }
}