import 'package:flutter/material.dart';
import 'package:to_do_app/addList.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/database/todo_model.dart';

class TodoList extends StatefulWidget {
  final List listOfToDos;
  Function(int) deleteListFunction;
  TodoList(
      {super.key, required this.listOfToDos, required this.deleteListFunction});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listOfToDos.length,
        itemBuilder: (BuildContext context, int index) => Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 16.0),
              child: Slidable(
                endActionPane: ActionPane(
                  motion: StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) {
                        widget.deleteListFunction(index);
                        print('deleted');
                      },
                      icon: Icons.delete,
                    )
                  ],
                ),
                child: ListTile(
                  title: Text(widget.listOfToDos[index][0]),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.yellow[600]!, width: 3.0)),
                  leading: Checkbox(
                    checkColor: Colors.pink,
                    value: widget.listOfToDos[index][1],
                    onChanged: (value) {
                      setState(() {
                        widget.listOfToDos[index][1] = value;
                        TodoModel todoModel = TodoModel();
                        todoModel.updateToDOList();
                        print(value);
                      });
                    },
                  ),
                ),
              ),
            ));
  }
}
