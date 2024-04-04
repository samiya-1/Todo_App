import 'package:flutter/material.dart';
import 'package:todolist/controller/TodolistController.dart';
import 'package:todolist/view/todohomepage/widget/tosinglecard.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  TextEditingController titleController = TextEditingController();
  //var mybox = Hive.box<TodoListModel>('todolist');
  @override
  void initState() {
    TodolistController.getInitKeys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "ToDo list",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final currentKey = TodolistController.todokeys[index];
                final currentelement = TodolistController.mybox.get(currentKey);
                return ToDoSingleCard(
                  title: currentelement?.title ?? '',
                  isDone: currentelement?.isDone ?? false,
                );
              },
              itemCount: TodolistController.todokeys.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0D3257),
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add New Task'),
                content: TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: "Enter task"),
                    autofocus: true),
                actions: [
                  TextButton(
                    child: Text('SAVE'),
                    onPressed: () {
                      TodolistController.addTask(
                        title: titleController.text,
                        isDone: false,
                      );
                      titleController.clear();
                      setState(() {});
                    },
                  ),
                ],
              );
            }),
        child: Center(
            child: Icon(
          Icons.add,
          color: Colors.white,
        )),
      ),
    );
  }
}
