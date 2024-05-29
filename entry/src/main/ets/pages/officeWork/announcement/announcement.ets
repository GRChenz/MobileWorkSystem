import Header from '../../../component/header'
import router from '@ohos.router'
import Notice,{ noticeList } from '../../../model/Notice'

@Entry
@Component
struct Announcement {
  @State title: string = ''
  // 数据源
  @State announcementList:Notice[] = noticeList




  aboutToAppear(){
    // 获取标题
    let params = router.getParams()
    if (params) {
      this.title = params["title"]
    }
    // 获取数据
  }

  build() {
    Column(){
      Header({title:this.title})
        .backgroundColor(Color.White)
        .padding(10)

      Scroll(){
        Column(){
          // 公告列表
          List(){
            ForEach(this.announcementList,(item:Notice,index:number)=>{
              ListItem(){
                Column({space:10}){
                  Row({space:10}){
                    Circle({width:15,height:15})
                      .fill(Color.Orange)
                    Text(item?.title)
                      .fontWeight(FontWeight.Bold)
                      .layoutWeight(1)
                  }
                  .width("100%")

                  Row(){
                    Text(item?.date)
                      .fontSize(12)
                      .fontColor(Color.Gray)
                    Blank()
                    Text("阅读:"+item?.read_count)
                      .fontSize(12)
                      .fontColor(Color.Gray)
                      .width("25%")
                  }
                  .width("80%")
                }
                .backgroundColor(Color.White)
                .padding(10)
                .width("100%")
              }
              .onClick(()=>{
                // 跳转到公告详情界面
                router.pushUrl({
                  url:"pages/officeWork/announcement/announcementDetail",
                  params:{
                    notice:item
                  }
                },router.RouterMode.Single)
              })
            })
          }
          .divider({strokeWidth:1,color:"#e4e4e4"})
        }
        .padding(10)
      }
    }
    .height("100%")
    .width("100%")
    .backgroundColor("#f1f1f1")
  }
}