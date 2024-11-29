import 'package:hive/hive.dart';

class TodoModel {
  var hiveBox = Hive.box('myOpenBox');
  late List<List<dynamic>> listOfToDos = [];

  void initializeDefaultTodoList() {
    listOfToDos = [
      ['go to shop', false],
      ['eat apple', false]
    ];
    hiveBox.put('LIST_OF_TODO_KEY', listOfToDos);
    print('Came to initialize default to do list method');
  }

  void readToDoList() {
    var todosFromHive = hiveBox.get('LIST_OF_TODO_KEY', defaultValue: []);
    if (todosFromHive is List) {
      listOfToDos = List<List<dynamic>>.from(todosFromHive);
    }
    print('ToDo List Retrieved from Hive');
  }

  void updateToDOList() {
    hiveBox.put('LIST_OF_TODO_KEY', listOfToDos);
    print('updatingggggggggggggg');
  }
}
