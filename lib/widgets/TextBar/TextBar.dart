import 'package:flutter/material.dart';

class TextBar extends StatelessWidget {
  final onTap;
  final String option;
  TextBar(this.onTap, this.option);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(6.0)),
              margin:
                  EdgeInsets.only(top: 7.0, bottom: 7.0, left: 8.0, right: 8.0),
              child: TextField(
                  decoration: InputDecoration(
                    hintText: 'bacba',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide:
                            BorderSide(width: 0.0, color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide:
                            BorderSide(width: 0.0, color: Colors.transparent)),
                  ),
                  keyboardType: TextInputType.number),
            ),
          ),
          // GestureDetector(
          //   onTap: () => {},
          // child:
          // Expanded(
          // child:
          Container(
            decoration: BoxDecoration(color: Colors.red),
            // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Text('MB'),
          ),
          // )
          // )
        ],
      ),
    );
  }
}
