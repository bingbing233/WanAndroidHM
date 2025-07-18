import { changeStatusBarColor } from '../utils/CommonUtils';
import { getStatusBarHeight, TopBar } from './common/Common';
import { PageHome } from './page_home/PageHome';
import { PageMine } from './page_mine/PageMine';
import { PageSquare } from './page_square/PageSquare';
import { PageStruct } from './page_struct/PageStruct';
import { PageWx } from './page_wx/PageWx';

@Entry
@Component
struct Index {
  @State
  private statusBarHeight: number = 0
  @State
  private index: number = 0
  @State
  private titles:string[] = ["首页", "广场", "公众号", "体系", "项目"]

  aboutToAppear(): void {
    getStatusBarHeight((h) => {
      this.statusBarHeight = h
    })
  }

  onPageShow(): void {
    changeStatusBarColor(getContext(this),"#FF2875F3","#ffffff")
  }

  build() {
    Column() {
      TopBar({
        title: this.titles[this.index], leftIcon: $r('app.media.ic_public_view_list_filled'), onLeftClick: () => {
        }
      })
      Tabs() {
        TabContent() {
          PageHome()
        }.tabBar("首页")

        TabContent() {
          PageSquare()
        }.tabBar("广场")

        TabContent() {
          PageWx()
        }.tabBar("公众号")

        TabContent() {
          PageStruct()
        }.tabBar("体系")

        TabContent() {
          PageMine()
        }.tabBar("我的")
      }
      .barPosition(BarPosition.End)
      .margin({ bottom: this.statusBarHeight * 2 })
      .scrollable(false)
      .onChange((index: number) => {
        this.index = index
        console.log("onchange",`title=${this.titles[this.index]}`);
      })
    }
    .height('100%')
    .width('100%')
    .padding({ top: this.statusBarHeight })
  }
}