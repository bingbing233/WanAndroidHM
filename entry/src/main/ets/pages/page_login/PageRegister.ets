import prompt from '@ohos.prompt';
import { changeStatusBarColor } from '../../utils/CommonUtils';
import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct PageRegister {
  @State username: string = '';
  @State password: string = '';
  @State confirmPassword: string = '';
  @State isPasswordVisible: boolean = false;
  @State isConfirmPasswordVisible: boolean = false;
  @State isProcessing: boolean = false;

  onPageShow(): void {
    changeStatusBarColor(getContext(this), "#F5F5F5", "#000000")
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
      .backgroundColor('#ffffff')
      .borderRadius(30)
      .margin({ top:50,left:20 })
      .alignSelf(ItemAlign.Start)
      .onClick(() => {
        router.back()
      })
      // 顶部标题
      Text('欢迎注册')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 80, bottom: 10 })
        .width('100%')
        .textAlign(TextAlign.Center)

      // 表单内容
      Column() {
        // 用户名输入框
        TextInput({ placeholder: '用户名' })
          .width('90%')
          .height(56)
          .margin({ top: 24 })
          .type(InputType.Normal)
          .placeholderColor('#99000000')
          .placeholderFont({ size: 16 })
          .fontColor('#DD000000')
          .fontSize(16)
          .backgroundColor('#FFFFFF')
          .borderRadius(4)
          .padding({ left: 16, right: 16 })
          .onChange((value: string) => {
            this.username = value.trim();
          })

        // 密码输入框
        Column() {
          Row() {
            TextInput({ placeholder: '密码' })
              .width('100%')
              .type(this.isPasswordVisible ? InputType.Normal : InputType.Password)
              .placeholderColor('#99000000')
              .placeholderFont({ size: 16 })
              .fontColor('#DD000000')
              .fontSize(16)
              .backgroundColor('#FFFFFF')
              .onChange((value: string) => {
                this.password = value;
              })

          }
          .width('100%')
          .height(56)
          .backgroundColor('#FFFFFF')
          .borderRadius(4)
        }
        .width('90%')
        .margin({ top: 16 })

        // 确认密码输入框
        Column() {
          Row() {
            TextInput({ placeholder: '确认密码' })
              .width('100%')
              .type(this.isConfirmPasswordVisible ? InputType.Normal : InputType.Password)
              .placeholderColor('#99000000')
              .placeholderFont({ size: 16 })
              .fontColor('#DD000000')
              .fontSize(16)
              .backgroundColor('#FFFFFF')
              .onChange((value: string) => {
                this.confirmPassword = value;
              })
          }
          .width('100%')
          .height(56)
          .backgroundColor('#FFFFFF')
          .borderRadius(4)
        }
        .width('90%')
        .margin({ top: 16 })

        // 注册按钮
        Button('注册', { type: ButtonType.Capsule, stateEffect: true })
          .width('90%')
          .height(48)
          .margin({ top: 32 })
          .backgroundColor('#6200EE')
          .fontColor('#FFFFFF')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .opacity(this.isFormValid() ? 1 : 0.5)
          .enabled(this.isFormValid() && !this.isProcessing)
          .onClick(() => {
            this.handleRegister();
          })

        // 已有账号，去登录
        Row() {
          Text('已有账号？')
            .fontSize(14)
            .fontColor('#99000000')

          Text('去登录')
            .fontSize(14)
            .fontColor('#6200EE')
            .margin({ left: 4 })
            .onClick(() => {
              // 跳转到登录页面逻辑
              // promptAction.showToast({ message: '跳转到登录页面' });
              router.back()
            })
        }
        .margin({ top: 16 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .margin({ top: 40 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  // 表单验证
  private isFormValid(): boolean {
    return this.username.length >= 3 &&
      this.password.length >= 6 &&
      this.password === this.confirmPassword;
  }

  // 注册处理
  private handleRegister() {
    this.isProcessing = true;
    prompt.showToast({ message: '注册中...', duration: 1000 });

    // 模拟注册请求
    setTimeout(() => {
      this.isProcessing = false;
      if (Math.random() > 0.3) {
        prompt.showToast({ message: '注册成功' });
        // 注册成功后的跳转逻辑
      } else {
        prompt.showToast({ message: '注册失败，请重试' });
      }
    }, 2000);
  }
}

