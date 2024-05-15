
@Component
export default  struct  myIndexCenter{
  build() {
    Row(){
      Column(){
        Text("累计年假").fontColor('#8889d0').fontSize('12sp')
        Text("15").fontColor('#4749a1').fontSize('18sp').fontWeight(800)
      }.height('100%').justifyContent(FlexAlign.SpaceEvenly)
      Column(){
        Text("累计病假").fontColor('#8889d0').fontSize('12sp')
        Text("15").fontColor('#4749a1').fontSize('18sp').fontWeight(800)
      }.height('100%').justifyContent(FlexAlign.SpaceEvenly)
      Column(){
        Text("累计调休").fontColor('#8889d0').fontSize('12sp')
        Text("15").fontColor('#4749a1').fontSize('18sp').fontWeight(800)
      }.height('100%').justifyContent(FlexAlign.SpaceEvenly)
    }.justifyContent(FlexAlign.SpaceAround).height('80vp').width('94%').borderRadius(10)
    .backgroundColor(Color.White).offset({y:-20})
  }
}