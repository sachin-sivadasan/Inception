import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextBar extends StatelessWidget {
  final onTap;
  final String option;
  TextBar(this.onTap, this.option);

  Widget getOptionWidget() {
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
        child: Text('$option ▼'),
      ),
    );
  }

  Widget textBox() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(6.0)),
        child: TextField(
            decoration: InputDecoration(
              hintText: 'bacba',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
                borderSide: BorderSide(width: 0.0, color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
                borderSide: BorderSide(width: 0.0, color: Colors.transparent),
              ),
            ),
            keyboardType: TextInputType.number),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 60.0,
        child: Row(
          children: [textBox(), getOptionWidget()],
        ),
      ),
    );
  }
}
