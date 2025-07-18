import router from '@ohos.router';
import { changeStatusBarColor } from '../../utils/CommonUtils';

@Entry
@Component
export struct PageLogin {
  @State username: string = '';
  @State password: string = '';
  @State isLoading: boolean = false;
  @State showPassword: boolean = false;
  @State errorMessage: string = '';

  onPageShow(): void {
    changeStatusBarColor(getContext(this), "#ffffff", "#000000")
  }

  build() {
    Column() {
      Button() {
        Image($rawfile('ic_arrow_back_black.svg'))
          .width(30)
          .height(30)
      }
      .width(50)
      .height(50)
      .backgroundColor('#F5F5F5')
      .borderRadius(30)
      .margin({ top:30 })
      .alignSelf(ItemAlign.Start)
      .onClick(() => {
        router.back()
      })

      // 标题区域
      Column() {
        Text('欢迎登录')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 100, bottom: 10 })
          .width('100%')
          .textAlign(TextAlign.Center)

        Text('请输入账号密码登录')
          .fontSize(16)
          .opacity(0.6)
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .margin({ bottom: 60 })

      // 输入表单区域
      Column() {
        // 用户名输入框
        Stack() {
          TextArea({
            placeholder: "用户名/邮箱",
          })
            .onChange((text) => {
              this.username = text
            })
            .width('100%')
            .height(50)
            .padding(15)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
            .caretColor('#1976D2')
            .fontSize(16)

          if (this.username) {
            Image($rawfile('ic_close.svg'))
              .width(20)
              .height(20)
              .objectFit(ImageFit.Contain)
              .position({ x: '90%', y: 15 })
              .onClick(() => {
                this.username = '';
              })
          }
        }
        .width('90%')
        .margin({ bottom: 20 })

        // 密码输入框
        Stack() {
          TextArea({
            placeholder: "密码"
          })
            .width('100%')
            .height(50)
            .padding(15)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
            .caretColor('#1976D2')
            .fontSize(16)

        }
        .width('90%')
        .margin({ bottom: 10 })

        // 错误提示
        if (this.errorMessage) {
          Text(this.errorMessage)
            .fontSize(14)
            .fontColor('#F44336')
            .width('90%')
            .margin({ bottom: 20 })
        }

        // 登录按钮
        Button(this.isLoading ? '登录中...' : '登录')
          .width('90%')
          .height(50)
          .backgroundColor('#1976D2')
          .fontColor('#FFFFFF')
          .fontSize(18)
          .borderRadius(8)
          .enabled(!this.isLoading)
          .onClick(() => {
            this.handleLogin();
          })
          .margin({ bottom: 20 })

        // 忘记密码
        Text('忘记密码?')
          .fontSize(16)
          .fontColor('#1976D2')
          .width('90%')
          .textAlign(TextAlign.End)
          .onClick(() => {
            // 跳转到忘记密码页面
            console.info('跳转到忘记密码页面');
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

      // 分隔线
      Stack({ alignContent: Alignment.Center }) {
        Row() {
          Divider()
            .layoutWeight(1)
            .strokeWidth(1)
            .color('#E0E0E0')

          Text('其他登录方式')
            .fontSize(14)
            .fontColor('#9E9E9E')
            .margin({ left: 10, right: 10 })

          Divider()
            .layoutWeight(1)
            .strokeWidth(1)
            .color('#E0E0E0')
        }
        .width('90%')
      }
      .width('100%')
      .margin({ top: 60, bottom: 40 })

      // 其他登录方式
      Row() {
        Button() {
          Image($rawfile('ic_google.svg'))
            .width(30)
            .height(30)
        }
        .width(60)
        .height(60)
        .backgroundColor('#F5F5F5')
        .borderRadius(30)
        .onClick(() => {
          console.info('Google登录');
        })

        Button() {
          Image($rawfile('ic_facebook.svg'))
            .width(30)
            .height(30)
        }
        .width(60)
        .height(60)
        .backgroundColor('#F5F5F5')
        .borderRadius(30)
        .margin({ left: 30, right: 30 })
        .onClick(() => {
          console.info('Facebook登录');
        })

        Button() {
          Image($rawfile('ic_wx.svg'))
            .width(30)
            .height(30)
        }
        .width(60)
        .height(60)
        .backgroundColor('#F5F5F5')
        .borderRadius(30)
        .onClick(() => {
          console.info('Twitter登录');
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 60 })

      // 注册提示
      Row() {
        Text('还没有账号?')
          .fontSize(16)
          .fontColor('#616161')

        Text('立即注册')
          .fontSize(16)
          .fontColor('#1976D2')
          .margin({ left: 5 })
          .onClick(() => {
            // 跳转到注册页面
            go2Register()
            console.info('跳转到注册页面');
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
    .padding({
      top:20,
      bottom:20,
      left:20,
      right:20
    })
    .alignItems(HorizontalAlign.Center)
  }

  // 处理登录逻辑
  handleLogin() {
    if (!this.username || !this.password) {
      this.errorMessage = '用户名和密码不能为空';
      return;
    }

    // 模拟登录过程
    this.isLoading = true;
    setTimeout(() => {
      // 模拟登录成功
      this.isLoading = false;
      router.pushUrl({
        url: 'pages/Index'
      });
    }, 1500);
  }
}

function go2Register() {
  router.pushUrl({
    url: "pages/page_login/PageRegister"
  })
}