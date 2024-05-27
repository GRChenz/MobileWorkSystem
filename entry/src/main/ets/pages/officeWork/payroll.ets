import Header from '../../component/header'
import router from '@ohos.router';
import salaryList,{ list } from '../../model/SalaryList';
import DateUtil from '../../utils/DateUtil';
import GroupInfo from '../../model/GroupInfo';

@Entry
@Component
struct Payroll {
  @State list:salaryList[] = list  // 数据源
  @State title:string = ""
  @State allSalary:number = 0
  @State salaryList:GroupInfo<number,salaryList>[] = []
  // 年份
  year:{value:ResourceStr}[] = [
    { value: `${new Date().getFullYear()}` },
    { value: `${new Date().getFullYear()-1}` },
    { value: `${new Date().getFullYear()-2}` },
    { value: `${new Date().getFullYear()-3}` },
    { value: `${new Date().getFullYear()-4}` },
  ]
  @State selectYear:string = `${new Date().getFullYear()}`
  // @State selectYear:string = `2024`

  // 初始化账单
  initSalaryList(){
    // 获取到年份
    let month:number[] = this.list.map((list)=>list.date.getMonth()+1)
    // 根据年份分组
    let group:GroupInfo<number,salaryList>[] = []
    month.forEach(month=>{
      group.push(
        new GroupInfo(month,this.list[month-1])
      )
    })

    this.salaryList = group

  }

  selectFilter(f:string){
    this.salaryList = this.salaryList.filter(item=>item.item.date.getFullYear().toString()==f)
    console.log('payroll',JSON.stringify(this.salaryList))
  }



  aboutToAppear(){
    // 获取到标题
    let params:any = router.getParams();
    if (params) {
      this.title = params["title"]
    }
    this.initSalaryList()
    this.selectFilter(this.selectYear)
    console.log('payroll',JSON.stringify(this.salaryList))
  }

  build() {
    Scroll(){
      Column(){
        // 标题
        Header({title: this.title})
          .padding(10)

        // 过滤选项
        Row(){
          Text("请选择年份")
          Select(this.year)
            .backgroundColor(Color.Transparent)
            .selected(0)
            .value(this.selectYear)
            .onSelect((index,value:string)=>{
              this.selectYear = value
              this.initSalaryList()
              this.selectFilter(value)
            })
          Blank()
          Text("合计:  " + `${this.allSalary}元`)
            .fontColor(Color.Gray)
            .fontSize(12)
        }
        .padding({left:10,right:10})
        .width("100%")



        List(){
          ForEach(this.salaryList, (item:GroupInfo<string|number,salaryList>,index:number)=>{
            ListItem(){
              Column(){
                Row(){
                  Image($r("app.media.salary")).width(30)

                  Column({space:10}){
                    Text(`${item.group}月份工资单`)
                      .fontWeight(FontWeight.Bold)
                      .fontSize(14)
                    Text(`${DateUtil.formatYMD2(item.item.date)}`)
                      .fontColor(Color.Gray)
                      .fontSize(10)
                  }
                  // 工资
                  Row(){
                    Text(`${item.item.salary}`)
                      .fontSize(18)
                      .fontColor($r("app.color.primary_color"))
                      .fontWeight(FontWeight.Bold)
                    Image($r("app.media.caret_right")).width(15)
                      .fillColor(Color.Gray)
                  }
                }
                .ItemStyle()
                .justifyContent(FlexAlign.SpaceBetween)

                Divider().width("95%").color('#f5f5f5')
              }

            }
          })
        }
        .padding(10)

      }
    }
    .align(Alignment.Top)
    .height("100%")
    .width("100%")
    .backgroundColor("#f1f1f1")

  }

  @Styles ItemStyle(){
    .backgroundColor(Color.White)
    .padding({top:20,bottom:20,left:10,right:10})
    .width("100%")
    .borderRadius(10)
  }
}