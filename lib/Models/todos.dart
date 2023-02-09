class ToDo{
  String title;
  String desc;
  DateTime? creationDate;
  bool isDone;

  ToDo( { required this.title,required this.desc, this.creationDate,this.isDone = false});
}