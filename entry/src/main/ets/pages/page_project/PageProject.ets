import { HomeArticle } from "../../net/module/HomeArticle"
import { ProjectClass } from "../../net/module/Project"
import { PageProjectVM } from "./PageProjectVM"
import App from "@system.app"

@Component
export struct PageProject {
  private vm: PageProjectVM = new PageProjectVM()
  @State
  curIndex: number = 0

  aboutToAppear(): void {
    this.vm.getProjectsClass()
  }

  build() {
    Column() {
      Tabs() {
        ForEach(this.vm.projectsClass, (item: ProjectClass, index: number) => {
          TabContent() {
            List() {
              ForEach(this.vm.curList, (article: HomeArticle, index: number) => {
                ListItem() {
                  ProjectItem({ project: article })
                }
              })
            }.width('100%').height('100%')
          }.tabBar(item.name)
        })
      }.barMode(BarMode.Scrollable).onChange((index: number) => {
        this.vm.getProjects(this.vm.projectsClass[index].id, false)
      })
    }.width('100%').height('100%')
  }
}

@Component
struct ProjectItem {
  @Prop
  project: HomeArticle

  build() {
    Row() {
      Image(this.project.envelopePic)
        .width(100)
        .height(200) // cover
      Column() {
        Text(this.project.title)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start) // title
        Text(this.project.desc)
          .fontSize(18)
          .fontColor($r("app.color.text_sub")) // desc
        Divider().layoutWeight(1)
        Row() {
          Text(this.project.author).fontSize(16).fontColor($r("app.color.text_sub"))
          Divider().layoutWeight(1)
          Text(this.project.niceDate).fontSize(16).fontColor($r("app.color.text_sub"))
        }
      }.height('100%').layoutWeight(1)
    }.width('100%').height(200).padding(8)
  }
}

@Component
@Preview
struct ProjectItemPreview {
  build() {
    Row() {
      Image("https://www.wanandroid.com/blogimgs/2f859d26-e80a-4f08-a62a-f1c8236333cf.png")
        .width(100)
        .height(200) // cover
      Column() {
        Text("全网更优质的Flutter版ChatGPT")
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start) // title
        Text("A large language model trained by open AI that can be used to answer")
          .fontSize(18)
          .fontColor($r("app.color.text_sub")) // desc
        Divider().layoutWeight(1)
        Row() {
          Text("llbbhh").fontSize(16).fontColor($r("app.color.text_sub"))
          Divider().layoutWeight(1)
          Text("2024-01-24 22:52").fontSize(16).fontColor($r("app.color.text_sub"))
        }
      }.height('100%').layoutWeight(1)
    }.width('100%').height(200).padding(8)
  }
}
