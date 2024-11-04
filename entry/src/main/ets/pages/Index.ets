import { PageHome } from './page_home/PageHome';
import { PageProject } from './page_project/PageProject';
import { PageSquare } from './page_square/PageSquare';
import { PageStruct } from './page_struct/PageStruct';
import { PageWx } from './page_wx/PageWx';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
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
          PageProject()
        }.tabBar("项目")
      }.barPosition(BarPosition.End)
    }
    .height('100%')
    .width('100%')
  }
}