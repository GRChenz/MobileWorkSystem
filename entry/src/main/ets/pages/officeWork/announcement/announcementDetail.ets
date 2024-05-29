import Header from '../../../component/header'
import Notice from '../../../model/Notice'
import router from '@ohos.router'

@Entry
@Component
struct AnnouncementDetail {
  @State title:string = "公告详情"
  @State notice:Notice = null

  aboutToAppear(){
    let params = router.getParams()
    if (params) {
      this.notice = params["notice"]
    }
  }

  build() {
    Column(){
      // 标题
      Header({title:this.title})
        .backgroundColor(Color.White)
        .padding(10)
      // 中间板块
      Column(){
        Row(){
          Text(this.notice?.title)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        Row(){
          Text("来源: " + this.notice.publish_department)
            .fontSize(14)
            .fontColor(Color.Gray)
          Blank()
          Text(this.notice.date)
            .fontSize(14)
            .fontColor(Color.Gray)
        }
        .width("100%")
        .padding(10)
      }
      .backgroundColor(Color.White)
      .padding(10)
      .margin({top:20})
      .width("100%")

      // 详细内容
      Scroll(){
        Text(this.notice.content)
          .fontSize(14)
      }
      .align(Alignment.Top)
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .backgroundColor(Color.White)
      .padding(10)
      .margin({top:20})
      .width("100%")
    }
    .backgroundColor("#f1f1f1")
    .height("100%")
    .width("100%")
  }
}