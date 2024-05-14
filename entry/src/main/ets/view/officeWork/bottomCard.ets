@Component
export default struct BottomCard {
  @State applyList:string[] = ['1'] // 遍历的数组


  build() {
    Row(){
      // 卡片
      Column(){
        // 卡片头部
        Row({space:2}){
          Image($r('app.media.subscribe')).width(20)
          Text('我的申请')
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
          Blank()
          Text('更多')
            .fontColor('#868686')
          Text('>')
            .fontColor('#cccccc')
        }
        .width('100%')
        Divider().margin({top:10,bottom:10})

        // 下半部分
        List(){
          ForEach(this.applyList,(item,index:number)=>{
            ListItem(){
              Row(){
                Column({space:10}){
                  // 标题位置
                  Row({space:5}){
                    Circle({width:14,height:14})
                      .fill('#444CA5')
                    Text(`请假申请`)
                      .fontWeight(FontWeight.Bold)
                  }
                  // 正文
                  Row(){
                    Text(`2020/11-26 至 2020/11-28 共 3 天`)
                      .fontSize(14)
                  }
                  .padding({left:20})

                  Row(){
                    Text('申请时间:' + `2022-12-10 17:10`)
                      .fontSize(14)
                    Blank()
                    // 判断条件
                    if (true) {
                      Text('待审批')
                        .fontSize(12)
                        .fontWeight(FontWeight.Bold)
                        .fontColor(Color.Orange)
                    }
                  }
                  .width('100%')
                  .padding({left:20})

                  if (this.applyList.length-1 != index){
                    Divider()
                  }

                }
                .width('100%')
                .padding({top:10,bottom:10})
                .alignItems(HorizontalAlign.Start)


              }
              .width('100%')
            }
          })
        }

      }
      .width('90%')
      .cardStyle()
    }
  }

  // 卡片样式
  @Styles cardStyle(){
    .backgroundColor('#FAFAFA')
    .padding(10)
    .borderRadius(10)
  }
}