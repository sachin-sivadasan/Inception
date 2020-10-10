import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  String value;
  ResultText(this.value);

  @override
  Widget build(BuildContext context) {
    if (value == null || value.isEmpty) return Container();
    return Material(
      elevation: 1.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
          child: Text(value),
        ),
      ),
    );
  }
}
