import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  String text;
  Function onPressedFunction;
  Buttons({required this.text, required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressedFunction(),
      child: Text(text),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
          side: MaterialStateProperty.all(BorderSide(color: Colors.black))),
    );
  }
}
