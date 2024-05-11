@Entry
@Component
struct Login {
  @State title: string = '一站式移动开发系统'
  username:string
  password:string

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
            // 下方面板
            Column({space:10}){
              // 登录
              Row(){
                Image($r('app.media.user')).height(20)
                TextInput({placeholder:'输入用户名'})
                  .backgroundColor(Color.Transparent)
                  .border({color: Color.Transparent })
                  .onChange(value=>{
                    let str = value
                    this.username = str
                  })
              }
              .width('100%')
              // 密码
              Row(){
                Image($r('app.media.lock')).height(20)
                TextInput({placeholder:'请输入密码'})
                  .backgroundColor(Color.Transparent)
                  .border({color: Color.Transparent })
                  .type(InputType.Password)
                  .onChange(value=>{
                    let str = value
                    this.password = str
                  })
              }
              .width('100%')

              // 提交按钮
              Row(){
                Button('登录').onClick((event: ClickEvent) => {
                  // 提交按钮操作
                  console.log('testTag','login','username',this.username)
                  console.log('testTag','login','password',this.password)
                })
                  .backgroundColor('#170bbd')
                  .width(250)
              }
              .margin({top:20})
              .width('100%')
              .justifyContent(FlexAlign.Center)
            }
            .cardStyle()

            // 描述条款
            this.agreement()

          }
          .offset({y:-30})
          .width('90%')

          Blank()
          // 忘记密码
          Text('忘记密码')
            .fontColor(Color.Blue)
            .fontSize(12)
            .margin({top:70})

        }
        .width('100%')
      }
      .backgroundColor(Color.White)

    }
  }


  // 输入框
  @Builder input($$:{value:string,placeholder:string,svg:ResourceStr,type?:InputType}){

  }

  // 描述条款
  @Builder agreement(){
    Row(){
      Text('登录即代表同意')
        .fontSize(12)
        .fontColor(Color.Gray)
      Text('《同意协议》')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
      Text('和')
        .fontSize(12)
        .fontColor(Color.Gray)
      Text('《隐私条款》')
        .fontWeight(FontWeight.Bold)
        .fontSize(12)
    }
    .margin({top:10})
  }

  // 卡片样式
  @Styles cardStyle(){
    .backgroundColor(Color.White)
    .shadow({radius:5})
    .borderRadius(15)
    .padding({ left:20,right:30,top:10,bottom:10 })
  }
}