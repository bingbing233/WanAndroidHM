import { promptAction, router, window } from "@kit.ArkUI"

@Preview
@Component
export struct TopBar {
  @Prop
  title: string = ""
  leftIcon: Resource = $r('app.media.ic_public_back')
  onLeftClick = () => {
    router.back()
  }

  build() {
    Row() {
      Image(this.leftIcon).width(20).height(20).onClick(this.onLeftClick)
      Divider().width(20)
      Text(this.title).fontColor(Color.White).fontSize(20).fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height(50)
    .backgroundColor($r('app.color.accent_color'))
    .padding({ left: 20 })
  }
}

// 刷新控件（未完成）
@Component
export struct RefreshList {
  private refreshHeaderHeight = 50
  private offsetY = -this.refreshHeaderHeight
  private lastX = 0
  private lastY = 0
  private downX = 0
  private downY = 0

  build() {
    Column() {
      // header布局
      Row() {
      }
      .id('refresh_header')
      .width('100%')
      .height(this.refreshHeaderHeight)
      .position({ x: 0, y: -this.refreshHeaderHeight }) // 利用该属性，把header布局在column顶部

      // content
      Column() {
      }
      .id('refresh_content')
      .height('100%')
      .width('100%')
      .position({ x: 0, y: 0 })
      .onTouch((event: TouchEvent) => {
        switch (event.type) {
          case TouchType.Down:
            this.onTouchDown(event)
            break;
          case TouchType.Move:
            this.onTouchMove(event)
            break;
          case TouchType.Up:
            this.onTouchUp(event)
            break;
          default:
            break;
        }
      })

      // footer
    }
  }

  private onTouchDown(event: TouchEvent) {
    this.lastX = event.touches[0].windowX
    this.lastY = event.touches[0].windowY
    this.downX = this.lastX
    this.downY = this.lastY
  }

  private onTouchMove(event: TouchEvent) {
    let curX = event.touches[0].windowX
    let curY = event.touches[0].windowY
    let delX = curX - this.lastX
    let delY = curY - this.lastY

    // 达到滑动条件
    if (Math.abs(delX) < Math.abs(delY) && Math.abs(delY) > 5) {

    }
  }

  private onTouchUp(event: TouchEvent) {
  }
}

export function showToast(msg: string) {
  promptAction.showToast({ message: msg })
}


// 沉浸式状态栏
export function fullScreen(windowStage: window.WindowStage) {
  // 状态栏沉浸
  let mainWindow = windowStage.getMainWindowSync()
  mainWindow.setSystemBarEnable(['status'])
  mainWindow.setWindowSystemBarProperties({
    statusBarColor: "#FF2875F3",
    isStatusBarLightIcon: true
  })
  mainWindow.setWindowLayoutFullScreen(true)
}

export function getStatusBarHeight(callback: Callback<number>) {
  window.getLastWindow(getContext(), (error, topWindow) => {
    if (topWindow) {
      let area = topWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      let height = px2vp(area.topRect.height)
      callback(height)
      console.log("getStatusBarHeight", "height = " + height);
    } else {
      callback(0)
    }
  })
}