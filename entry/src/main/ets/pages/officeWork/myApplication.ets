import router from '@ohos.router'
import Header from '../../component/header'
import MyListItem from '../../component/myListItem'
import ApplyList from '../../model/ApplyList'


@Entry
@Component
struct MyApplication {
  @State title: string = '我的申请'  // 标题
  @State currentIndex:number = 0  // 下标

  // 接收到的参数
  @State applyList:ApplyList[] = []

  // 一些设置的属性
  selectedFontColor:ResourceColor = Color.Blue
  fontColor:ResourceColor = Color.Black


  aboutToAppear(){
    let params:any = router.getParams() as ApplyList[]
    if (params) {
      this.applyList = params;
    }
  }

  build() {
    Column(){
      Header({title:this.title})
        .zIndex(100)
        .padding(10)
      Tabs(){
        TabContent(){
          // Text('全部申请界面')
          MyListItem({applyList:this.applyList})
            .ItemListStyle()

        }
        .TabContentStyle()
        .tabBar(this.TabBuilder({index:0,name:"全部"}))
        TabContent(){
          Text('人事管理界面')
        }
        .TabContentStyle()
        .tabBar(this.TabBuilder({index:1,name:"人事管理"}))
        TabContent(){
          Text('行政事务界面')
        }
        .TabContentStyle()
        .tabBar(this.TabBuilder({index:2,name:"行政事务"}))
        TabContent(){
          Text('财务类界面')
        }
        .TabContentStyle()
        .tabBar(this.TabBuilder({index:3,name:"财务类"}))
        TabContent(){
          Text('业务相关界面')
        }
        .TabContentStyle()
        .tabBar(this.TabBuilder({index:4,name:"业务相关"}))

      }
      .barMode(BarMode.Fixed)
      .animationDuration(200)
      .zIndex(10)
      .scrollable(false)
      .onChange((index)=>{
        this.currentIndex = index;
      })

    }
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


  @Styles TabContentStyle(){
    .align(Alignment.Top)
    .backgroundColor('#f1f1f1')
  }

  @Styles ItemListStyle(){
    .backgroundColor(Color.White)
    .padding(10)
    .margin(10)
    .borderRadius(5)
  }


}