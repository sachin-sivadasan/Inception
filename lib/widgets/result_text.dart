import 'package:flutter/material.dart';
import '../Transform/Transform.dart';

class ResultText extends StatelessWidget {
  String value;
  ResultText(this.value);

  @override
  Widget build(BuildContext context) {
    if (value == null || value.isEmpty) return Container();
    return Material(
      elevation: 1.0,
      color: '#28167E'.toHexColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                'result',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
