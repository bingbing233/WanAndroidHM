import { urlHomeBanner } from '../../net/Urls'
import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { HomeBanner } from '../../net/module/HomeBanner'
import { BaseModule } from '../../net/BaseModule'

@ObservedV2
export class PageHomeVM {
  private TAG = "PageHomeVM"

  @Trace
  homeBanners: HomeBanner[] = []

  getHomeBanner() {
    let url = urlHomeBanner
    let req = http.createHttp()
    req.request(url, (err: BusinessError, data: http.HttpResponse) => {
      if (!err) {
        let banner = JSON.parse(data.result as string) as BaseModule<HomeBanner[]>
        this.homeBanners = banner.data ? banner.data : []
        console.log(this.TAG,banner.data)
      } else {
        console.log(this.TAG, err.message)
      }
    })
  }
}