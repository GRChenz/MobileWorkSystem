import ApplyList from '../../model/ApplyList'
import BottomCard from '../../view/officeWork/bottomCard'
import MiddleCard from '../../view/officeWork/middleCard'
import OfficeWorkHead from '../../view/officeWork/officeWorkHead'

@Component
export default struct OfficeWork {

  @Provide applyList:ApplyList[] = [
    new ApplyList('陈显洪',new Date(),new Date(new Date().setDate(new Date().getDate()+4)),'测试理由',3,1),
    new ApplyList('陈洪',new Date(),new Date(new Date().setDate(new Date().getDate()+42)),'测试理由',1,2),
    new ApplyList('显洪',new Date(),new Date(new Date().setDate(new Date().getDate()+51)),'测试理由',2,3),
    new ApplyList('陈显',new Date(),new Date(new Date().setDate(new Date().getDate()+1)),'测试理由',0,4),
    new ApplyList('洪显',new Date(),new Date(new Date().setDate(new Date().getDate()+3)),'测试理由',2,5),
  ] // 遍历的数组

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