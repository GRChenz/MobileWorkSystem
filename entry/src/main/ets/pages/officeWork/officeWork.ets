import BottomCard from '../../view/officeWork/bottomCard'
import MiddleCard from '../../view/officeWork/middleCard'
import OfficeWorkHead from '../../view/officeWork/officeWorkHead'

@Component
export default struct OfficeWork {

  build() {
    Scroll(){
      Column(){
        // 头部（标题和天气,待审批和会议提示等等）
        OfficeWorkHead()
        // 中间卡片
        MiddleCard()
          .margin({top:-60})
          // .translate({y:-80})

        // 底部卡片
        BottomCard()
          .margin({top:20})

      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#f3f3f3')
    .align(Alignment.Top)
    .padding({bottom:10})
  }
}