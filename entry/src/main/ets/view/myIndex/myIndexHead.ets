
@Component
export default  struct  myIndexHead{
  build() {
    Column(){
      Image($r("app.media.test_akuya")).objectFit(ImageFit.Fill).width('88vp').height('80vp')
        .borderRadius('80vp').borderWidth(2).borderColor('#f1f1f1')
      Row({space:10}){
        Text('风莹月').fontColor(Color.White).fontSize('20sp')
        Text('技术部').fontColor('#6a6bcd').backgroundColor('#d5d5ff').fontSize('16sp')
          .padding({top:3,bottom:3,left:5,right:5}).borderRadius(3)
      }
      Text("工号: 1314").fontSize("14sp").fontColor(Color.White)
    }.justifyContent(FlexAlign.SpaceEvenly).backgroundColor('#4749a1').width('100%').height('250vp')
    .borderRadius({bottomLeft:20,bottomRight:20})
  }
}











