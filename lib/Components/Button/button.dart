import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final onpress;
  final String text;
  Button(this.onpress, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: IntrinsicWidth(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          color: Colors.lightBlue,
          onPressed: onpress,
          child: Text(text),
        ),
      ],
    )));
  }
}
