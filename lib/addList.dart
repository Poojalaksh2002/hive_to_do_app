import 'package:flutter/material.dart';
import 'package:to_do_app/todo_list.dart';
import 'package:to_do_app/utils/buttons.dart';

class Addlist extends StatelessWidget {
  Function(String) addListFunction;
  Addlist({super.key, required this.addListFunction});

  @override
  Widget build(BuildContext context) {
    final addTextController = TextEditingController();

    return Container(
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: addTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Buttons(
                  text: 'Save',
                  onPressedFunction: () {
                    if (addTextController.text.isNotEmpty) {
                      addListFunction(addTextController.text);
                    }
                    Navigator.of(context).pop();
                  }),
              Buttons(
                  text: 'Cancel',
                  onPressedFunction: () => Navigator.of(context).pop())
            ],
          )
        ],
      ),
    );
  }
}
