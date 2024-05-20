/**
 * 时间工具类
 */
class DateUtil{
  /**
   * 将时间格式化为年月日显示
   * @param date
   * @returns
   */
  formatYMD(date:Date):string{
    let rs:string;
    rs = date.getFullYear() + "/" + (date.getMonth()+1) + "/" + date.getDate();
    return rs;
  }

  /**
   * 第二种将时间转换为年月日格式的方法
   * @param date
   * @returns
   */
  formatYMD1(date:Date):string{
    let rs:string;
    rs = date.getFullYear() + "/" + (date.getMonth()+1) + "-" + date.getDate();
    return rs;
  }

  getDifference(Sdate:Date,Edate:Date):number{
    let rs = (Edate.getTime()-Sdate.getTime())/1000/60/60/24;
    return rs;
  }

}

let dateUtil = new DateUtil();
export default dateUtil as DateUtil;