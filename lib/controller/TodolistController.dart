import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/model/todolistmodel.dart';

class TodolistController {
  static List todokeys = [];
  static Box<TodoListModel> mybox = Hive.box<TodoListModel>('todolist');

  static void addTask({
  required String title,
  required bool isDone,
}) {
  var task = TodoListModel(title: title, isDone: isDone); // Create a TodoListModel object
  mybox.add(task); // Add the object to the box
  todokeys = mybox.keys.toList();
}


  static void getInitKeys() {
    todokeys = mybox.keys.toList();
  }

  static void deletetodo(var key) {
    mybox.delete(key);
    todokeys = mybox.keys.toList();
  }
}
