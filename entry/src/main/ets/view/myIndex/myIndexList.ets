class myIndexLists{
  icon:Resource
  title:string

  constructor(icon:Resource,title:string) {
    this.icon=icon
    this.title=title
  }
}


@Component
export default  struct  myIndexList{

  ListItems:myIndexLists[]=[
    {icon:$r('app.media.star'),title:'我的请假'},
    {icon:$r('app.media.star'),title:'我的请假'},
    {icon:$r('app.media.star'),title:'我的请假'},
    {icon:$r('app.media.star'),title:'我的请假'},
    {icon:$r('app.media.star'),title:'我的请假'},
  ]

  build() {
    List(){
      ListItemGroup(){
        ForEach(this.ListItems,(item,index)=>{
          ListItem(){
            Row({space:5}){
              Image(item.icon).width(40)
              Text(item.title).fontSize(14)
            }.width('95%').padding({top:10,bottom:5,left:5}).margin(5)
          }
        },item=>item)
      }
    }.width('96%').backgroundColor(Color.White).layoutWeight(1)
  }
}