import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/model/todolistmodel.dart';
import 'package:todolist/view/todohomepage/todohomepage.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoListModelAdapter());
  await Hive.openBox<TodoListModel>('todolist');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoHomePage(),
    );
  }
}
