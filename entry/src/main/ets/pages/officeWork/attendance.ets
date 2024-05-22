/**
 * 考勤打卡界面
 */
import router from '@ohos.router';
import Header from '../../component/header';

@Entry
@Component
struct Attendance {
  @State title:string = ""




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


          // 个人资料
          Row({space:5}){
            Image($r("app.media.test_akuya"))
              .width(50)
              .clip(new Circle({width:'100%',height:'100%'}))

            Flex({wrap:FlexWrap.Wrap}){
              Row(){
                // 姓名
                Text("晨曦熊")
                  .fontSize(22)
                  .fontWeight(FontWeight.Bolder)
                Blank()
                // 日期
                Text("5月22日 星期三")
                  .textAlign(TextAlign.End)
                  .fontColor("#868686")
              }
              .width('100%')

              Row(){
                // 职位
                Text("技术部-成员")
                  .fontColor("#868686")

                Blank()
                Text("考勤规则")
                  .fontColor("#379acc")
                  .border({color:"#379acc",width:1,radius:3})
                  .padding(2)

                Blank()
                Text("申请")
                  .fontColor(Color.White)
                  .backgroundColor(Color.Orange)
                  .padding(3)
                  .borderRadius(2)
              }
              .margin({top:10})
              .width('100%')

            }
            .layoutWeight(1)

          }
          .CardType()
          .alignItems(VerticalAlign.Top)


          Row(){
            Column(){
              // 上班打卡
              this.DAKA({color:$r("app.color.primary_color"),time:"09:00",dakaTime:"08:50",local:"华为深圳研发基地",type:"上班"})
              // 下班打卡
              this.DAKA({color:Color.Orange,time:"17:00",dakaTime:"17:02",local:"华为深圳研发基地",type:"下班"})

            }
          }
          .CardType()





        }
        .width('100%')
        .padding(10)
      }
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
      .layoutWeight(1)



    }
    .height('100%')
    .width('100%')
    // .backgroundColor('red')
    .backgroundColor('#f1f1f1')
  }

  @Builder DAKA($$:{color:ResourceColor,time:string,dakaTime:string,local:string,type:string}){
    // 上班时间标题位置
    Row(){
      Circle({width:14,height:14}).fill($$.color)
        .margin({right:20})
      // 上班时间
      Text(`${$$.type}时间`)
      Text(` ${$$.time} `)
    }
    .width('100%')
    // 上班打卡按钮
    Row(){
      Stack(){
        Circle({width:120,height:120}).fill($$.color)
        Column(){
          Text(`${$$.type}打卡`)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
          // 打卡时间
          Text(` ${$$.dakaTime} `)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
        }
      }
    }
    .margin({top:20})
    .width('100%')
    .justifyContent(FlexAlign.Center)

    // 位置信息
    Row({space:8}){
      Image($r("app.media.location"))
        .width(30)
        .fillColor("#cccccc")
      Text($$.local)
    }
  }

  @Styles CardType(){
    .backgroundColor(Color.White)
    .width('100%')
    .margin({top:20})
    .padding(10)

  }
}