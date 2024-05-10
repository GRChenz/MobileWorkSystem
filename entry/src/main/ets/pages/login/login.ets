@Entry
@Component
struct Login {
  @State title: string = '一站式移动开发系统'

  build() {
    Scroll(){
      Stack({alignContent:Alignment.Top}){
        Column(){

          // 顶部图片
          Stack({alignContent:Alignment.Top}){
            Image($r('app.media.login_top')).height('55%')
            Row(){
              Text(this.title)
                .fontSize(30)
                .fontColor(Color.Gray)
            }
            .justifyContent(FlexAlign.End)
            .width('100%')
            .height(70)
          }

          // 下半部分
          Column(){
            // 下方输入框
            Column({space:10}){
              this.input({placeholder:'登录',svg:$r('app.media.user')})
              this.input({placeholder:'密码',svg:$r('app.media.lock')})
            }
            .cardStyle()
            // 提交按钮
            Row(){
              Button('登录').onClick((event: ClickEvent) => {
                // 提交按钮操作
              })
                .backgroundColor('#170bbd')
                .width('50%')
            }
            .margin({top:20})
            .width('100%')
            .justifyContent(FlexAlign.Center)
          }
          .offset({y:-30})
          .width('90%')

        }
        .width('100%')
      }
      .height("100%")
      .backgroundColor(Color.White)

    }
  }


  // 输入框
  @Builder input($$:{placeholder:string,svg:ResourceStr}){
    Row(){
      Image($$.svg).height(20)
      TextInput({placeholder:$$.placeholder})
        .backgroundColor(Color.Transparent)
        .border({color: Color.Transparent })
    }
    .width('100%')
  }

  @Styles cardStyle(){
    .backgroundColor(Color.White)
    .shadow({radius:5})
    .borderRadius(15)
    .padding({ left:20,right:30,top:10,bottom:10 })
  }
}