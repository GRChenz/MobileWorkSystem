import Header from '../../component/header'
import router from '@ohos.router'
import salaryList from '../../model/SalaryList'
import DateUtil from '../../utils/DateUtil';

@Entry
@Component
struct DetailedPayroll {
  @State title: string = '';
  @State item?:salaryList = null;
  aboutToAppear(){
    let params:any = router.getParams()
    if (params) {
      this.item = params.item;
      this.title = new Date(params.item.date).getMonth()+1+"月份工资单";
    }
    console.log(JSON.stringify(params));
  }

  build() {
    Column(){
      Header({title:this.title})
        .backgroundColor(Color.White)
        .padding(10)
      Scroll(){
        Column(){
          // 展示卡片
          this.Card1()

          this.Card2()

        }
        .padding(10)
      }
    }
    .align(Alignment.Top)
    .width("100%")
    .height("100%")
    .backgroundColor("#f1f1f1")
  }

  @Styles ItemStyle(){
    .backgroundColor(Color.White)
    .padding({top:20,bottom:20,left:10,right:10})
    .width("100%")
    .borderRadius(10)
  }


  @Builder Card1(){
    Row(){
      Column(){
        Text(`${DateUtil.formatYM(this.item?.date)}`)
        Text("实发工资")
          .fontColor(Color.Gray)
          .fontSize(14)
      }
      .alignItems(HorizontalAlign.Start)
      Blank()
      // 金额
      Text(`￥${this.item.salary}`)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
        .fontColor($r("app.color.primary_color"))
    }
    .justifyContent(FlexAlign.Start)
    .ItemStyle()
  }

  @Builder Card2(){
    Column({space:20}){
      this.Card2Item("工号","QF004548")
      this.Card2Item("所在部门","技术部")
      this.Card2Item("基本工资","3000")
      this.Card2Item("绩效工资","4000")
      this.Card2Item("缺勤天数","0")
      this.Card2Item("病假天数","0")
      this.Card2Item("福利奖金","500")
      this.Card2Item("社保合计","300")
      this.Card2Item("公积金合计","300")
    }
    .justifyContent(FlexAlign.Start)
    .ItemStyle()
    .margin({top:10})
  }

  @Builder Card2Item(title:string,text:string){
    Row(){
      Text(title)
      Blank()
      Text(text)
    }.width("100%")
  }
}