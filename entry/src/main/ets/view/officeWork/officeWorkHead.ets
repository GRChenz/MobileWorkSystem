
@Component
export default struct OfficeWorkHead {
  build() {
    Column(){
      // 头部上半部分，包括标题和天气
      Row(){
        Row(){
          Text('我的办公')
            .fontColor(Color.White)
            .fontSize(30)
            .fontWeight(FontWeight.Bolder)
            .margin({left:20})
        }
        Blank()
        // 天气
        Row(){
          Column(){
            Text('8℃')
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
            Text('5月14日')
              .fontColor(Color.White)
          }
          Image($r('app.media.upload'))
            .width(40)
            .syncLoad(true)
            .fillColor(Color.White)

        }
        .margin({right:20})
      }
      .padding({bottom:10})
      .alignItems(VerticalAlign.Bottom)
      .width('100%')
      .height(100)

      Divider().color(Color.White)

      // 头部下半部分，包括待审批、会议提醒、周报、工作汇报
      Flex(){
        this.HeadText({title:'待审批', num:15})
        this.HeadText({title:'会议提醒', num:2})
        this.HeadText({title:'周报', num:1})
        this.HeadText({title:'工作汇报', num:5})
      }
      .margin({top:20})
      .padding({right:20,left:20})
      .width('100%')

    }
    .padding({bottom:80})
    .backgroundColor('#454DA6')
  }

  @Builder HeadText($$:{title:string,num:number}){
    Column({space:8}){
      Text(`${$$.title}`)
        .fontColor('#d1d1d1')
      Text(`${$$.num}`)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
    }
    .flexGrow(1)
  }
}

