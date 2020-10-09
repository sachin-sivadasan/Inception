import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextBar extends StatelessWidget {
  final onTap;
  final String option;
  TextBar(this.onTap, this.option);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 60.0,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6.0)),
                child: TextField(
                    decoration: InputDecoration(
                      hintText: 'bacba',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(
                              width: 0.0, color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(
                              width: 0.0, color: Colors.transparent)),
                    ),
                    keyboardType: TextInputType.number),
              ),
            ),
            // GestureDetector(
            //   onTap: () => {},
            // child:
            // Expanded(
            //   child:
            Container(
              height: double.infinity,
              // constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(color: Colors.green),
              // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Text('MB'),
            ),
            // )
            // )
          ],
        ),
      ),
    );
  }
}
