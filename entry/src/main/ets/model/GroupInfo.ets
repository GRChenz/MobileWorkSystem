export default class groupInfo<T,I>{
  group:T;
  item:I;

  constructor(group:T,item:I) {
    this.group = group;
    this.item = item;
  }
}