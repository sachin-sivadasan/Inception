import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextBar extends StatelessWidget {
  final onTap;
  final leftText;
  final String option;
  TextBar({this.onTap, this.option, this.leftText});

  Widget getOptionWidget() {
    if (option == null) return Container();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(6.0),
        ),
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        margin: EdgeInsets.only(left: 10.0),
        constraints: BoxConstraints(minWidth: 80.0),
        child: Text('$option ▼'),
      ),
    );
  }

  Widget leftLabel() {
    if (leftText == null) return Container();
    return Row(
      children: [
        Text(leftText, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
        Container(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: VerticalDivider(
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget textBox() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 15.0),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(6.0)),
        child: Row(children: [
          leftLabel(),
          Expanded(
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter value',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: Row(
        children: [textBox(), getOptionWidget()],
      ),
    );
  }
}
