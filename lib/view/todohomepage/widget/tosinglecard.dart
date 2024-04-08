import 'package:flutter/material.dart';
import 'package:todolist/controller/TodolistController.dart';

class ToDoSingleCard extends StatefulWidget {
  const ToDoSingleCard({
    Key? key,
    required this.title,
    this.isDone = false,
    this.onDeletepress,
  }) : super(key: key);

  final String title;
  final bool isDone;
  final void Function()? onDeletepress;

  @override
  _ToDoSingleCardState createState() => _ToDoSingleCardState();
}

class _ToDoSingleCardState extends State<ToDoSingleCard> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Text(
                widget.title,
                style: TextStyle(
                  decoration: _isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
          InkWell(
              onTap: () {
                TodolistController.deletetodo(1);
              },
              child: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
