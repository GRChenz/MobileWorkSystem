import MyListItem from '../../component/myListItem'
import ApplyList from '../../model/ApplyList'

@Component
export default struct BottomCard {
  @State applyList:ApplyList[] = [
    new ApplyList('陈显洪',new Date(),new Date(new Date().setDate(new Date().getDate()+4)),'测试理由',3,1),
    new ApplyList('陈洪',new Date(),new Date(new Date().setDate(new Date().getDate()+42)),'测试理由',1,2),
    new ApplyList('显洪',new Date(),new Date(new Date().setDate(new Date().getDate()+51)),'测试理由',2,3),
    new ApplyList('陈显',new Date(),new Date(new Date().setDate(new Date().getDate()+1)),'测试理由',0,4),
    new ApplyList('洪显',new Date(),new Date(new Date().setDate(new Date().getDate()+3)),'测试理由',2,5),


  ] // 遍历的数组

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