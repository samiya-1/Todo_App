import 'package:hive/hive.dart';
part 'todolistmodel.g.dart';

@HiveType(typeId: 0)
class TodoListModel {
  @HiveField(0)
  bool? isDone;
  @HiveField(1)
  String? title;

  TodoListModel({required this.isDone, required this.title});
}
