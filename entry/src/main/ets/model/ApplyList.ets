
  /**
   * 列表类 我的申请 以及 申请详情当中的信息
   */
  @Observed
  export default class ApplyList{
    id?:string;
    approveNumber?:string;  // 审批编号
    department?:string;  // 所在部门
    initiator:string;  // 发起人
    startDate:Date;  // 请假/加班开始时间
    endDate:Date;  // 请假/加班结束时间
    applyDate:Date; // 申请时间
    cc_persons?:string[];  // 抄送人
    approveStatus:number = 0;  // 审批状态 1：待审批 2：正在审批中 3：审批通过 4：拒绝
    status:number = 1 // 状态 1:启动 0:禁用
    typeId:number;  // 类型id
    reason?:string;  // 请假，加班原因
    departmentLeader?:string;  // 部门领导
    personnelDepartment?:string;  // 人事部

    // 暂时用这构造
    constructor(initiator: string,
                startDate: Date,
                endDate: Date,
                reason?:string,
                typeId:number = 0,
                approveStatus:number = 1,
                applyDate: Date = new Date(),
                ) {
      this.initiator = initiator;
      this.startDate = startDate;
      this.endDate = endDate;
      this.typeId = typeId;
      this.approveStatus = approveStatus;
      this.applyDate = applyDate;
      this.reason = reason;
    }




  }

