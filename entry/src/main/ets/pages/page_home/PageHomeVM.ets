import { getUrlHomeArticles, urlHomeBanner } from '../../net/Urls'
import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { HomeBanner } from '../../net/module/HomeBanner'
import { BaseModule } from '../../net/BaseModule'
import { HomeArticle, HomeArticleResp } from '../../net/module/HomeArticle'
import { faceDetector } from '@kit.CoreVisionKit'

@ObservedV2
export class PageHomeVM {
  private TAG = "PageHomeVM"
  private curPage: number = 0
  @Trace
  homeBanners: HomeBanner[] = []
  @Trace
  homeArticles: HomeArticle[] = []
  @Trace
  isRefreshing: boolean = false
  @Trace
  isLoading: boolean = false

  getHomeBanner() {
    let url = urlHomeBanner
    let req = http.createHttp()
    req.request(url, (err: BusinessError, data: http.HttpResponse) => {
      if (!err) {
        let banner = JSON.parse(data.result as string) as BaseModule<HomeBanner[]>
        this.homeBanners = banner.data ? banner.data : []
        console.log(this.TAG, banner.data)
      } else {
        console.log(this.TAG, err.message)
      }
    })
  }

  getHomeArticle(isLoadMore: boolean = false) {
    if (this.isRefreshing || this.isLoading) {
      return
    }

    if (!isLoadMore) {
      this.curPage = 0
      this.isRefreshing = true
    } else {
      this.isLoading = true
    }
    let url = getUrlHomeArticles(this.curPage)
    let req = http.createHttp()
    req.request(url, (err: BusinessError, data: http.HttpResponse) => {
      this.isRefreshing = false
      this.isLoading = false

      if (!err) {
        let articleResp = JSON.parse(data.result as string) as BaseModule<HomeArticleResp>
        let respList = articleResp.data?.datas ? articleResp.data.datas : []
        if (isLoadMore) {
          this.homeArticles = this.homeArticles.concat(respList)
        } else {
          this.homeArticles = respList
        }
        console.log(this.TAG, JSON.stringify(respList))
        this.curPage += 1
      } else {
        console.log(this.TAG, err.message)
      }
    })
  }

  // mockArticle() {
  //   this.isLoading = true
  //   setTimeout(()=>{
  //     this.isLoading = false
  //     this.homeArticles = this.homeArticles.concat(this.homeArticles)
  //   },1000)
  // }
}