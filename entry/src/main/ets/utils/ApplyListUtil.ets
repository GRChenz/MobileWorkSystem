
/**
 * 列表工具类
 */
class ApplyListUtil{
  /**
   * 获取状态
   * @param approveStatus
   * @returns
   */
  getApproveStatus(approveStatus:number):string{
    switch(approveStatus){
      case 1:
        return "待审批";
        break;
      case 2:
        return "正在审批中";
        break;
      case 3:
        return "审批通过";
      case 4:
        return "拒绝";
      default:
        return "未定义状态"
        break;
    }
  }

  /**
   * 获取申请的颜色
   * @param approveStatus
   * @returns
   */
  getApproveStatusColor(approveStatus:number):ResourceColor{
    switch(approveStatus){
      case 1:
        return Color.Orange;
        break;
      case 2:
        return "#29cc4f";
        break;
      case 3:
        return "审批通过";
      case 4:
        return "拒绝";
      default:
        return "#000000"
        break;
    }
  }


  /**
   * 获取申请类型
   * @param typeId
   * @returns
   */
  getType(typeId:number):string{
    switch (typeId) {
      case 0:
        return "其它申请"
        break;
      case 1:
        return "请假申请"
        break;
      case 2:
        return "加班申请"
        break;
      default:
        return "未定义的申请"
        break;
    }
  }

  /**
   * 获取申请类型的颜色(暂时没启用)
   * @param typeId
   * @returns
   */
  getTypeColor(typeId:number):ResourceColor{
    return "#444ac5"
    // switch (typeId) {
    //   default:
    //     return "#444ac5"
    //     break;
    // }
  }
}

let applyListUtil = new ApplyListUtil();
export default applyListUtil as ApplyListUtil