import router from '@ohos.router'
import MyListItem from '../../component/myListItem'
import ApplyList from '../../model/ApplyList'

@Component
export default struct BottomCard {
  @Consume applyList:ApplyList[]

  build() {
    Row(){
      // 卡片
      Column(){
        // 卡片头部
        Row({space:2}){
          Image($r('app.media.subscribe')).width(20)
          Text('我的申请')
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
          Blank()
          Text('更多')
            .onClick(()=>{
              router.pushUrl({
                url:"pages/officeWork/myApplication",
                params:this.applyList
              },router.RouterMode.Single)
            })
            .fontColor('#868686')
          Text('>')
            .fontColor('#cccccc')
        }
        .width('100%')
        Divider().margin({top:10,bottom:10})

        // 下方列表
        MyListItem({applyList:this.applyList})

      }
      .width('90%')
      .cardStyle()
    }
  }

  // 卡片样式
  @Styles cardStyle(){
    .backgroundColor('#FAFAFA')
    .padding(10)
    .borderRadius(10)
  }
}