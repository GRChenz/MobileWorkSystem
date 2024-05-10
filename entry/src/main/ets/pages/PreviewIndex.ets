import router from '@ohos.router'

@Entry
@Component
struct  PreviewIndex{

  enterLogin(){
    router.replaceUrl({
      url:'pages/Login',
    })
  }

  @State time:number=5
  timer:number=-1
  onPageShow(){
    this.timer=setInterval(()=>{
      this.time--
      if(this.time<=0){
        this.enterLogin()
        clearInterval(this.timer)
      }
    },1000)
  }

  build() {
    Stack({alignContent:Alignment.TopEnd}){
      Image($r("app.media.icon_preview_main"))
        .width('100%').height('100%')
      Row(){
        Text(`跳过 ${this.time}`).fontSize(24).textAlign(TextAlign.Center).width(80).margin({left:10})
          .onClick(()=>{
            clearInterval(this.timer)
            this.enterLogin()
          })
      }.width(100).height(50).borderRadius(20).backgroundColor(Color.White).opacity(0.5)
      .margin({top:20,right:20})
    }
    .height('100%').width('100%')
  }
}