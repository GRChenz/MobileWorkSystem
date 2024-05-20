import Header from '../../component/header'

@Entry
@Component
struct MyApplication {
  @State title: string = '我的申请'

  @State currentIndex:number = 0

  // 一些设置的属性
  selectedFontColor:ResourceColor = Color.Blue
  fontColor:ResourceColor = Color.Black

  build() {
    Column(){
      Header({title:this.title})
      Tabs(){
        TabContent(){
          Text('全部申请界面')
        }.tabBar(this.TabBuilder({index:0,name:"全部"}))
        TabContent(){
          Text('人事管理界面')
        }.tabBar(this.TabBuilder({index:1,name:"人事管理"}))
        TabContent(){
          Text('行政事务界面')
        }.tabBar(this.TabBuilder({index:2,name:"行政事务"}))
        TabContent(){
          Text('财务类界面')
        }.tabBar(this.TabBuilder({index:3,name:"财务类"}))
        TabContent(){
          Text('业务相关界面')
        }.tabBar(this.TabBuilder({index:4,name:"业务相关"}))

      }
      .animationDuration(100)
      .zIndex(10)
      .scrollable(false)
      .onChange((index)=>{
        this.currentIndex = index;
      })

    }
    .padding(10)
    .align(Alignment.Top)
  }




  @Builder TabBuilder($$:{index: number, name: string}) {
    Column() {
      Text($$.name)
        .textAlign(TextAlign.Center)
        .fontColor(this.currentIndex === $$.index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === $$.index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 7, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === $$.index ? 1 : 0)
    }.width('100%')
  }
}