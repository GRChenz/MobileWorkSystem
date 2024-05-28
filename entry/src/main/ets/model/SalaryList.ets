export default class salaryList{
  month?:number;
  year?:number;
  icon?:ResourceStr = $r('app.media.salary');  // 图标
  date:Date;  // 日期
  salary:number;  // 总工资
}

export const month:number[] = [
  12,11,10,9,8,7,6,5,4,3,2,1
]


export const list:salaryList[] = [
  {salary:6900,date:new Date("2024-1-10")},
  {salary:6900,date:new Date("2024-2-10")},
  {salary:6900,date:new Date("2024-3-10")},
  {salary:6900,date:new Date("2024-4-10")},
  {salary:6900,date:new Date("2023-1-10")},
  {salary:6900,date:new Date("2023-3-10")},
  {salary:6900,date:new Date("2023-5-10")},
  {salary:6900,date:new Date("2022-1-10")},
  {salary:8000,date:new Date("2022-2-10")},
  {salary:7000,date:new Date("2022-3-10")},
  {salary:7500,date:new Date("2022-4-10")},
  {salary:6800,date:new Date("2022-5-10")},
  {salary:7700,date:new Date("2022-6-10")},
  {salary:7800,date:new Date("2022-7-10")},
  {salary:10000,date:new Date("2022-8-10")},
  {salary:12000,date:new Date("2022-9-10")},
  {salary:8000,date:new Date("2022-10-10")},
  {salary:7000,date:new Date("2022-11-10")},
  {salary:9000,date:new Date("2022-12-10")},
]