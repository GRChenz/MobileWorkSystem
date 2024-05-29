import router from '@ohos.router'
import ApplyList from '../../model/ApplyList'

@Component
export default struct MiddleCard {
  @Consume applyList:ApplyList[]

  @State featureList:{id:number,name:string,img?:Resource}[] = [
    {id:0,name:"请假申请",img:$r('app.media.application_leave')},
    {id:1,name:"考勤打卡",img:$r('app.media.daka')},
    {id:2,name:"汇报",img:$r('app.media.sync')},
    {id:3,name:"OA审批",img:$r('app.media.sync')},
    {id:4,name:"补卡申请",img:$r('app.media.sync')},
    {id:5,name:"工资单",img:$r('app.media.salaryLogo')},
    {id:6,name:"公司公告",img:$r('app.media.announcement_logo')},
    {id:7,name:"规章制度",img:$r('app.media.sync')},
    // '请假申请','考勤打卡','汇报','OA审批',
    // '补卡申请','工资单','公司公告','规章制度',
  ]


  aboutToAppear(){
    console.log('middleCard','applyList',JSON.stringify(this.applyList));
  }

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
          ForEach(this.featureList,(item:{id:number,name:string,img?:Resource},index:number)=>{
            GridItem(){
             Column({space:10}){
               Image(item.img).width(40)
               Text(`${item.name}`)
             }
            }
            .onClick(()=>{
              let i:number = item.id
              let url:string = '';
              let params:any = {};
              Object.assign(params,{title:item.name})  // 新增一个KV
              switch (i) {
                case 0:
                  url = "pages/officeWork/applicationLeave"
                  break;
                case 1:
                  url = "pages/officeWork/attendance"
                  break;
                case 5:
                  url = "pages/officeWork/payroll"
                  break;
                case 6:
                  url = "pages/officeWork/announcement/announcement"
                  break;
                default:
                  url = router.getState().path+router.getState().name
                  break;
              }

              // 跳转到对应id的界面
              router.pushUrl({
                url:url,
                params:params
              },router.RouterMode.Single)
            })
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
  @Builder drag($$:{text:{name:string,img?:Resource}}){
    Column({space:10}){
      Image($$.text.img).width(40)
      Text(`${$$.text.name}`)
    }
  }

  // 卡片样式
  @Styles cardStyle(){
    .backgroundColor('#FAFAFA')
    .padding(10)
    .borderRadius(10)
  }
}

