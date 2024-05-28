import Header from '../../component/header'
import router from '@ohos.router';
import salaryList,{ list, month } from '../../model/SalaryList';
import DateUtil from '../../utils/DateUtil';
import GroupInfo from '../../model/GroupInfo';

@Entry
@Component
struct Payroll {
  @State list:salaryList[] = list  // 数据源(所有的工资单)
  @State title:string = ""  // 标题
  @State allSalary:number = 0  // 合计的工资
  @State salaryList:GroupInfo<number,salaryList>[] = []  // 按月份分组后的工资
  // 年份选项
  year:{value:ResourceStr}[] = [
    { value: `${new Date().getFullYear()}` },
    { value: `${new Date().getFullYear()-1}` },
    { value: `${new Date().getFullYear()-2}` },
    { value: `${new Date().getFullYear()-3}` },
    { value: `${new Date().getFullYear()-4}` },
  ]
  // 当前选择的年份
  @State selectYear:string = `${new Date().getFullYear()}`
  // @State selectYear:string = `2024`

  // 初始化账单方法
  groupSalaryList(list:salaryList[]){
    // 获取到月份
    let m:number[] = month.reverse();

    // 根据月份分组
    let group:GroupInfo<number,salaryList>[] = []
    m.forEach(month=>{
      group.push(new GroupInfo(month,list[month-1]))
    })

    this.salaryList = group
  }


  // 根据年份进行过滤
  selectFilter<T>(f:string,items:T[]){
    let res:T[] = items.filter(item=>JSON.stringify(item["date"].getFullYear())==f)
    // console.log('payroll','过滤后的结果',JSON.stringify(res))
    return res;
  }

  // 求和所有的薪水
  sumSalary(list:salaryList[]){
    let sum:number = 0;
    list.forEach(list=> {
      sum += list.salary
    })
    return sum;
  }


  aboutToAppear(){
    // 获取到标题
    let params:any = router.getParams();
    if (params) {
      this.title = params["title"]
    }
    // 获取到所有的账单
    // 根据年份过滤
    let list:salaryList[] = this.list;
    console.log("过滤前的结果",JSON.stringify(list))
    list = this.selectFilter(this.selectYear,list)
    // 求和总金额
    this.allSalary = this.sumSalary(list)
    // 按照月份进行分组
    this.groupSalaryList(list)

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
              let list = this.list

              list = this.selectFilter(value,list)
              // 求和总金额
              this.allSalary = this.sumSalary(list)
              this.groupSalaryList(list)
            })
          Blank()
          Text("合计:  " + `${this.allSalary}元`)
            .fontColor(Color.Gray)
            .fontSize(12)
        }
        .padding({left:10,right:10})
        .width("100%")


        // 工资单列表
        List(){
          ForEach(this.salaryList, (item:GroupInfo<string|number,salaryList>,index:number)=>{
            ListItem(){
              if (item.item){
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