
@Component
export default struct MiddleCard {

  @State featureList:string[] = [
    '请假申请','考勤打卡','汇报','OA审批',
    '补卡申请','工资单','公司公告','规章制度',
    'test1','test2','test3','test4','test5']

  build() {
    Row(){
      // 卡片
      Column(){
        // 卡片头部
        Row({space:2}){
          Image($r('app.media.list')).width(20)
          Text('应用管理')
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
          Blank()
          Text('自定义')
            .fontColor('#868686')
          Text('>')
            .fontColor('#cccccc')
        }
        .width('100%')
        Divider().margin({top:10,bottom:10})


        Grid(){
          ForEach(this.featureList,(item)=>{
            GridItem(){
             Column({space:10}){
               Image($r('app.media.sync')).width(40)
               Text(`${item}`)
             }
            }
            .height(100)

          })
        }
        .editMode(true)
        .supportAnimation(true)
        .height(200)
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .onItemDragStart((event:ItemDragInfo,index:number)=>{
          return this.drag({text:this.featureList[index]});
        })
        .onItemDrop((event:ItemDragInfo,ItemIndex:number,InsertIndex:number,isSuccess:boolean)=>{
          if (!isSuccess || ItemIndex >= this.featureList.length) {
            return;
          }
          this.changeIndex(ItemIndex,InsertIndex)
        })
      }
      .cardStyle()
      .width('90%')
    }
  }

  changeIndex(index1:number, index2:number) { //交换数组中的位置
    const temp = this.featureList[index1];
    if (index1 > index2) {
      this.featureList.splice(index2, 0, temp);
      this.featureList.splice(index1 + 1, 1);
    } else {
      this.featureList.splice(index2 + 1, 0, temp);
      this.featureList.splice(index1, 1);
    }
  }

  // 拖拽后的样式
  @Builder drag($$:{text:string}){
    Column({space:10}){
      Image($r('app.media.sync')).width(40)
      Text(`${$$.text}`)
    }
  }

  // 卡片样式
  @Styles cardStyle(){
    .backgroundColor('#FAFAFA')
    .padding(10)
    .borderRadius(10)
  }
}

