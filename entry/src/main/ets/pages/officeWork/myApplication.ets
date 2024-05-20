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
    console.log("myApplication","applyList",JSON.stringify(this.applyList))
    console.log("myApplication","applyList.startDate type",typeof this.applyList[0].startDate)
  }

  build() {
    Column(){
      Header({title:this.title})
      Tabs(){
        TabContent(){
          // Text('全部申请界面')
          MyListItem({applyList:this.applyList})

        }
        .align(Alignment.Top)
        .tabBar(this.TabBuilder({index:0,name:"全部"}))
        TabContent(){
          Text('人事管理界面')
        }
        .align(Alignment.Top)
        .tabBar(this.TabBuilder({index:1,name:"人事管理"}))
        TabContent(){
          Text('行政事务界面')
        }
        .align(Alignment.Top)
        .tabBar(this.TabBuilder({index:2,name:"行政事务"}))
        TabContent(){
          Text('财务类界面')
        }
        .align(Alignment.Top)
        .tabBar(this.TabBuilder({index:3,name:"财务类"}))
        TabContent(){
          Text('业务相关界面')
        }
        .align(Alignment.Top)
        .tabBar(this.TabBuilder({index:4,name:"业务相关"}))

      }
      .barMode(BarMode.Fixed)
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