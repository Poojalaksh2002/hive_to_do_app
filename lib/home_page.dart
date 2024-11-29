import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'addList.dart';
import 'database/todo_model.dart';
import 'todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _hiveBox = Hive.box('myOpenBox');
  TodoModel todoModel = TodoModel();

  @override
  void initState() {
    if (_hiveBox.get('LIST_OF_TODO_KEY') == null) {
      todoModel.initializeDefaultTodoList();
    } else {
      todoModel.readToDoList();
    }
    setState(() {});
    super.initState();
  }

  //add todolist
  addListFunction(String text) {
    setState(() {
      todoModel.listOfToDos.add([text, false]);
      todoModel.updateToDOList();
    });
  }

  deleteListFunction(int index) {
    setState(() {
      todoModel.listOfToDos.removeAt(index);
      todoModel.updateToDOList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: TodoList(
          listOfToDos: todoModel.listOfToDos,
          deleteListFunction: deleteListFunction),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext) {
                return AlertDialog(
                  content: Addlist(addListFunction: addListFunction),
                );
              });
        },
      ),
    );
  }
}
