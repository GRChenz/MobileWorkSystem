import ApplyList from '../model/ApplyList'
import ApplyListUtil from '../utils/ApplyListUtil'
import DateUtil from '../utils/DateUtil'

@Component
export default struct MyListItem {
  @Prop applyList:ApplyList[]

  build() {
    // 下半部分
    List(){
      ForEach(this.applyList,(item:ApplyList,index:number)=>{
        ListItem(){
          Row(){
            Column({space:10}){
              // 标题位置
              Row({space:5}){
                Circle({width:14,height:14})
                  .fill(`${ApplyListUtil.getTypeColor(item.typeId)}`)
                Text(`${ApplyListUtil.getType(item.typeId)}`)
                  .fontWeight(FontWeight.Bold)
              }
              // 正文
              Row(){
                Text(`${DateUtil.formatYMD1(item.startDate)} 至 ${DateUtil.formatYMD1(item.endDate)} 共 ${DateUtil.getDifference(item.startDate,item.endDate)} 天`)
                  .fontSize(14)
              }
              .padding({left:20})

              Row(){
                Text('申请时间:' + `${item.applyDate?DateUtil.formatYMD(item.applyDate):"未定义申请时间"}`)
                  .fontSize(14)
                Blank()
                Text(`${ApplyListUtil.getApproveStatus(item.approveStatus)}`)
                  .fontSize(12)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(`${ApplyListUtil.getApproveStatusColor(item.approveStatus)}`)
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

  @Styles ItemListStyle(){
    .backgroundColor(Color.White)
    .padding(10)
    .margin(10)
    .borderRadius(5)
  }






}

