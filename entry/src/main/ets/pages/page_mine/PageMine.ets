import { router } from "@kit.ArkUI"

// Index.ets
@Component
export struct PageMine {
  @State isLoggedIn: boolean = false
  @State nickname: string = "用户昵称"
  @State userId: string = "123456789"
  @State avatarUrl: string = "resources/base/media/avatar.png"

  build() {
    Column() {
      if (this.isLoggedIn) {
        // 已登录状态
        this.LoggedInView()
      } else {
        // 未登录状态
        this.UnloggedView()
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  LoggedInView() {
    Column() {
      // 圆形头像
      Stack() {
        Image(this.avatarUrl)
          .width(120)
          .height(120)
          .borderRadius(60)
          .border({ width: 3, color: '#f0f0f0' })
      }
      .margin({ bottom: 20 })

      // 用户信息
      Text(this.nickname)
        .fontSize(24)
        .fontColor('#333')
        .margin({ bottom: 5 })

      Text(`ID: ${this.userId}`)
        .fontSize(14)
        .fontColor('#999')

      // 收藏入口
      Row() {
        Column() {
          Image('resources/base/media/icon_favorite.png')
            .width(24)
            .height(24)
            .margin({ bottom: 5 })

          Text('我的收藏')
            .fontSize(14)
            .fontColor('#666')
        }
        .onClick(() => {
          // 跳转到收藏页面
          console.log("跳转到收藏页面")
        })
        .margin({ right: 30 })

        // 可以添加更多功能入口
      }
      .justifyContent(FlexAlign.Center)
      .margin({ top: 30 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  UnloggedView() {
    Column() {
      // 默认头像
      Stack() {
        Image('resources/base/media/icon_user.png')
          .width(60)
          .height(60)
      }
      .width(120)
      .height(120)
      .borderRadius(60)
      .backgroundColor('#f8f8f8')
      .margin({ bottom: 20 })

      // 提示信息
      Text('未登录')
        .fontSize(22)
        .fontColor('#666')
        .margin({ bottom: 10 })

      Text('登录后查看个人主页')
        .fontSize(14)
        .fontColor('#999')

      // 登录按钮
      Button('立即登录')
        .width(180)
        .height(40)
        .fontSize(16)
        .backgroundColor('#1e88e5')
        .fontColor(Color.White)
        .margin({ top: 40 })
        .onClick(() => {
          // 模拟登录成功
          // this.isLoggedIn = true
          // 实际应用中这里应该跳转到登录页面
          go2Login()
          console.log("跳转到登录页面")
        })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}

function go2Login() {
  router.pushUrl({
    url: "pages/page_login/PageLogin",
  })
}