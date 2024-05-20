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
    date = new Date(date);
    let year = date.getFullYear();
    let month = date.getMonth()+1;
    let day = date.getDate();
    return year + "/" + month + "/" + day;
  }

  /**
   * 第二种将时间转换为年月日格式的方法
   * @param date
   * @returns
   */
  formatYMD1(date:Date):string {
    date = new Date(date);
    let year = date.getFullYear();
    let month = date.getMonth()+1;
    let day = date.getDate();
    return year + "/" + month + "-" + day;
  }


  getDifference(Sdate:Date,Edate:Date):number{
    Sdate = new Date(Sdate);
    Edate = new Date(Edate);
    let rs = (Edate.getTime() - Sdate.getTime())/1000/60/60/24;
    return rs;
  }

}

let dateUtil = new DateUtil();
export default dateUtil as DateUtil;