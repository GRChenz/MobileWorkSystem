import myIndexCenter from '../../../view/myIndex/myIndexCenter'
import myIndexHead from '../../../view/myIndex/myIndexHead'
import myIndexList from '../../../view/myIndex/myIndexList'


@Component
export default struct  myIndex{
  build() {
    Column(){
      //我的页面-头部
      myIndexHead()
      //我的页面-中部
      myIndexCenter()
      //我的页面-列表
      myIndexList()
    }.alignItems(HorizontalAlign.Center).backgroundColor('#f5f5f5')
    .width('100%').height('100%')
  }
}