import router from '@ohos.router'

@Component
export default struct Header {
  @Link title:string
  build() {
    Row(){
      Row(){
        Image($r('app.media.arrow_left')).width(30)
          .onClick(()=>{
            router.back()
          })
      }
      Row(){
        Text(this.title==''?'title未定义':this.title)
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .justifyContent(FlexAlign.Center)
      .layoutWeight(1)
      Row(){
      }
      .width(30)
    }
    .width('100%')
  }
}