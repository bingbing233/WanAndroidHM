import { HomeBanner } from '../../net/module/HomeBanner'
import { PageHomeVM } from './PageHomeVM'
import { router } from '@kit.ArkUI'
import { HomeArticle } from '../../net/module/HomeArticle'
import { showToast } from '../common/Common'

@ComponentV2
export struct PageHome {
  private vm: PageHomeVM = new PageHomeVM()
  private ctl = new SwiperController()

  aboutToAppear(): void {
    this.vm.getHomeBanner()
    this.vm.getHomeArticle()
  }

  @Builder
  footer() {
    Row() {
      LoadingProgress().height(32).width(48)
      Text("加载中")
    }.width("100%")
    .height(64)
    .justifyContent(FlexAlign.Center)
    // 当不处于加载中状态时隐藏组件
    .visibility(this.vm.isLoading ? Visibility.Visible : Visibility.None)
  }

  build() {
    Refresh({ refreshing: this.vm.isRefreshing, promptText: "正在刷新..." }) {
      List() {
        ListItem() {
          // banner
          Swiper(this.ctl) {
            ForEach(this.vm.homeBanners, (item: HomeBanner) => {
              Image(item.imagePath).width('100%').height(200).onClick(() => {
                // 点击跳转到webview，并且打开链接
                go2Web(item.url)
              })
            })
          }.loop(true).interval(3000).width('100%').height(200)
        }

        // articles
        ForEach(this.vm.homeArticles, (item: HomeArticle) => {
          ListItem() {
            Column() {
              HomeArticleItem({
                author: getAuthor(item.author, item.shareUser),
                title: item.title,
                tag: item.superChapterName,
                time: item.niceDate,
                url: item.link
              }).width('100%')
              Divider().height(1).width('100%')
            }
          }
        })

        ListItem() {
          this.footer()
        }
      }
      .width('100%')
      .onScrollIndex((s, e) => {
        if (e >= this.vm.homeArticles.length - 1) {
          this.vm.getHomeArticle(true)
        }
      })
      .edgeEffect(EdgeEffect.Fade)
    }
    .width('100%')
    .height('100%')
    .onRefreshing(() => {
      this.vm.getHomeArticle()
    })
  }
}

@Component
@Preview
struct HomeArticleItem {
  author: string = "author"
  title: string = "title"
  tag: string = "tag"
  time: string = "time"
  url: string = "url"

  build() {
    Column() {
      Row() {
        Text(this.author).fontSize(14).fontColor($r('app.color.text_sub'))
        Divider().layoutWeight(1).height(0)
        Text(this.time).fontSize(14).fontColor($r('app.color.text_sub'))
      }.width('100%')

      Text(this.title)
        .maxLines(2)
        .ellipsisMode(EllipsisMode.END)
        .fontSize(16)
        .width('100%')
        .fontColor($r('app.color.text_main'))
        .layoutWeight(1)

      Text(this.tag).fontSize(14).fontColor($r('app.color.text_sub')).width('100%')
    }.width('100%').height(120).padding(10).onClick(() => {
      go2Web(this.url)
    })
  }
}

function go2Web(url: string) {
  router.pushUrl({
    url: "pages/page_web/PageWeb",
    params: { url: url }
  })
}

function getAuthor(...names: string[]) {
  let realName = ""
  for (let index = 0; index < names.length; index++) {
    const element = names[index];
    if (element.length != 0) {
      realName = element
      break
    }
  }
  return realName
}