export default class Notice{
  title?:string;
  date?:string;
  read_count?:number;
  publish_department?:string = "未知来源";
  content?:string;
}

// 模拟数据
export const noticeList:Notice[] = [
  {title:"关于2024年元旦放假通知，请悉知。祝大家节日快乐",date:"2024-12-08",read_count:30,publish_department:"人事部",content:`
各位员工们：
端午节假期将至，首先向全体员工们致以节日的问候，为了度过欢乐、祥和、平安的节日，20x
年端午节的放假时光：20xx年6月20日至6月22日放假公休，共3天。6月20日（星期六，农历端午节当日）
为国家法定节假日，6月21日（星期日）公休，6月22日（星期一）补休。
特提醒全体人员注意以下几点：
一、各部门在节前要组织一次安全检查，进行全面的安全自查，杜绝一切安全隐患。包括：不留人
的房间锁好门窗、不用的设备应切断电源连续使用的设备应安排专人值班，确保使用安全重要物品妥
善保管，注意防火防盗。
二、对值班人员开会进行一次安全教育，教育值班人员遵守公司制度，提高安全意识。
三、各部门在节前要加强对仓库物品的管理，严格执行出入库管理规定。
四、做好车辆安全管理工作，节日用车严格审批。驾驶员应遵守交通规则、注意行车安全。严禁酒
后驾车、疲劳驾车、超速超载开车行为。
五、所有员工们端午节期间手机务必持续开机，到外地的务必开通漫游，以便持续联络；外出回家
探亲的员工们，注意路途安全，及时购买返程票，防止由于车票紧张而延误节后上班。
六、端午节期间，大家要注意安全。
祝全体员工们节日愉快，身体健康！
X公司人力资源部
20xx年5月25日
`},
  {title:"关于2023年元旦放假通知，请悉知。祝大家节日快乐",date:"2023-12-08",read_count:130,publish_department:"人事部",content:`
各位员工们：
端午节假期将至，首先向全体员工们致以节日的问候，为了度过欢乐、祥和、平安的节日，20x
年端午节的放假时光：20xx年6月20日至6月22日放假公休，共3天。6月20日（星期六，农历端午节当日）
为国家法定节假日，6月21日（星期日）公休，6月22日（星期一）补休。
特提醒全体人员注意以下几点：
一、各部门在节前要组织一次安全检查，进行全面的安全自查，杜绝一切安全隐患。包括：不留人
的房间锁好门窗、不用的设备应切断电源连续使用的设备应安排专人值班，确保使用安全重要物品妥
善保管，注意防火防盗。
二、对值班人员开会进行一次安全教育，教育值班人员遵守公司制度，提高安全意识。
三、各部门在节前要加强对仓库物品的管理，严格执行出入库管理规定。
四、做好车辆安全管理工作，节日用车严格审批。驾驶员应遵守交通规则、注意行车安全。严禁酒
后驾车、疲劳驾车、超速超载开车行为。
五、所有员工们端午节期间手机务必持续开机，到外地的务必开通漫游，以便持续联络；外出回家
探亲的员工们，注意路途安全，及时购买返程票，防止由于车票紧张而延误节后上班。
六、端午节期间，大家要注意安全。
祝全体员工们节日愉快，身体健康！
X公司人力资源部
2023年12月25日`},
  {title:"关于2022年元旦放假通知，请悉知。祝大家节日快乐",date:"2022-12-08",read_count:70,publish_department:"人事部",content:`
各位员工们：
端午节假期将至，首先向全体员工们致以节日的问候，为了度过欢乐、祥和、平安的节日，20x
年端午节的放假时光：20xx年6月20日至6月22日放假公休，共3天。6月20日（星期六，农历端午节当日）
为国家法定节假日，6月21日（星期日）公休，6月22日（星期一）补休。
特提醒全体人员注意以下几点：
一、各部门在节前要组织一次安全检查，进行全面的安全自查，杜绝一切安全隐患。包括：不留人
的房间锁好门窗、不用的设备应切断电源连续使用的设备应安排专人值班，确保使用安全重要物品妥
善保管，注意防火防盗。
二、对值班人员开会进行一次安全教育，教育值班人员遵守公司制度，提高安全意识。
三、各部门在节前要加强对仓库物品的管理，严格执行出入库管理规定。
四、做好车辆安全管理工作，节日用车严格审批。驾驶员应遵守交通规则、注意行车安全。严禁酒
后驾车、疲劳驾车、超速超载开车行为。
五、所有员工们端午节期间手机务必持续开机，到外地的务必开通漫游，以便持续联络；外出回家
探亲的员工们，注意路途安全，及时购买返程票，防止由于车票紧张而延误节后上班。
六、端午节期间，大家要注意安全。
祝全体员工们节日愉快，身体健康！
X公司人力资源部
20xx年5月25日`},
]