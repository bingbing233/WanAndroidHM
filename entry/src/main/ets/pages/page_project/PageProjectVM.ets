import { http } from '@kit.NetworkKit';
import { BaseModule } from '../../net/BaseModule';
import { ProjectClass } from '../../net/module/Project';
import { getUrlProjects, urlProjectClass } from '../../net/Urls';
import { ArrayList, HashMap, LinkedList, List } from '@kit.ArkTS';
import { HomeArticle, HomeArticleResp } from '../../net/module/HomeArticle';

@ObservedV2
export class PageProjectVM {
  private TAG = "PageProjectVM"
  @Trace
  projectsClass: ProjectClass[] = []
  @Trace
  projects: HashMap<number, HomeArticle[]> = new HashMap()
  curPageMap: HashMap<number, number> = new HashMap()
  @Trace
  curList:HomeArticle[] = []

  getProjectsClass() {
    let url = urlProjectClass
    let req = http.createHttp()
    req.request(url, (err, data) => {
      if (!err) {
        let projectsClassResp = JSON.parse(data.result as string) as BaseModule<ProjectClass[]>
        this.projectsClass = projectsClassResp.data ? projectsClassResp.data : []
        this.projectsClass.forEach(element => {
          this.curPageMap[element.id] = 0
        });
        console.log(this.TAG, data.result)
      } else {
        console.log(this.TAG, err.message)
      }
    })
  }

  getProjects(cid: number,isLoadMore:boolean) {
    let req = http.createHttp()
    let curPage = 0
    if (isLoadMore) {
      curPage = this.curPageMap[cid]
      curPage += 1
    } else {
      curPage = 0
    }
    // 记录当前页
    this.curPageMap[cid] = curPage

    let url = getUrlProjects(curPage, cid)
    req.request(url, (err, data) => {
      if(!err){
        let projectsResp = JSON.parse(data.result as string) as BaseModule<HomeArticleResp>
        if(isLoadMore){
          let oldList:HomeArticle[] = this.projects[cid]
          let newList:HomeArticle[] = []
          newList.concat(oldList)
          newList.concat(projectsResp.data?.datas!!)
        } else {
          this.projects[cid] = projectsResp.data
        }
        this.curList = this.projects[cid]
        console.log(this.TAG, data.result)
      } else {
        console.log(this.TAG, err.message)
      }
    })
  }
}