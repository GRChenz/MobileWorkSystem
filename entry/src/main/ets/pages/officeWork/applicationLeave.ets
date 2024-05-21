import router from '@ohos.router'
import Header from '../../component/header'

@Entry
@Component
struct ApplicationLeave {
  @State title:string = ""

  // 请假类型
  private typies:{value:ResourceStr,icon?:ResourceStr}[] = [
    {value:'年假'},
    {value:'事假'},
    {value:'病假'},
    {value:'调休'},
    {value:'婚假'},
    {value:'其它'},
  ]

  aboutToAppear(){
    let params:any = router.getParams();
    if (params) {
      this.title = params["title"]
    }
  }

  build() {
    Column(){
      // 头部
      Header({title:this.title})
        .backgroundColor(Color.White)
        .padding(10)
        .zIndex(100)


      Scroll(){
        Column(){


          // 请假类型
          Row(){
            Text('请假类型')
              .fontWeight(FontWeight.Bold)
              .fontSize(25)
            Blank()
            Select(this.typies)
              .value("请选择")
          }
          .CardType()


          // 请假理由
          Column(){
            Text("请假事由")
              .width('100%')
              .fontWeight(FontWeight.Bold)
              .fontSize(25)
            TextArea({placeholder:"请输入"})
              .layoutWeight(1)
              .backgroundColor(Color.Transparent)
          }
          .height(300)
          .CardType()

          // 审批流程
          Column(){
            Text("审批流程")
              .width('100%')
              .fontWeight(FontWeight.Bold)
              .fontSize(25)

            // 流程图
            this.LiuChenTu()
          }
          .CardType()

        }
      }
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
      .layoutWeight(1)

      // 按钮
      Row(){
        Button("提交")
          .type(ButtonType.Normal)
          .borderRadius(5)
          .width('90%')
          .backgroundColor("#444CA5")
      }
      .backgroundColor(Color.White)
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding(10)



    }
    .height('100%')
    .width('100%')
    // .backgroundColor('red')
    .backgroundColor('#f1f1f1')

  }


  @Styles CardType(){
    .backgroundColor(Color.White)
    .width('100%')
    .margin({top:20})
    .padding(10)

  }


  @Builder LiuChenTu(){
    Row({space:20}){
      Column({space:8}){
        Row({space:10}){
          Circle({width:50,height:50})
            .fill("#0088cc")
          Image($r('app.media.arrow_right')).width(30)
            .fillColor("#6caccc")
        }
        Text("发起人")
          .textAlign(TextAlign.Center)
      }
      .alignItems(HorizontalAlign.Start)

      Column({space:8}){
        Row({space:10}){
          Circle({width:50,height:50})
            .fill("#0088cc")
          Image($r('app.media.arrow_right')).width(30)
            .fillColor("#6caccc")
        }
        Text("部门领导")
          .textAlign(TextAlign.Center)
      }
      .alignItems(HorizontalAlign.Start)

      Column({space:8}){
        Circle({width:50,height:50})
          .fill("#0088cc")
        Text("人事部")
          .textAlign(TextAlign.Center)
      }
      .alignItems(HorizontalAlign.Start)

    }
    .width('100%')
  }

}