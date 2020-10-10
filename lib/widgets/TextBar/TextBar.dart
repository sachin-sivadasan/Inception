import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inception/model/conver_model.dart';
import 'package:inception/widgets/DropDownView/drop_down.dart';

class TextBar extends StatelessWidget {
  final Function(String, String) onSelectItem;
  final leftText;
  String option = '';
  String type = '';
  TextBar({this.onSelectItem, this.type, this.option, this.leftText});

  List<String> entries = <String>['Bytes', 'KB', 'MB', 'GB'];
  Widget getOptionWidget() {
    print('option $option, type $type');
    if (option == null) return Container();
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: IntrinsicWidth(
        child: DropDownView(
          bgColor: Colors.grey.shade200,
          entries: entries,
          onItemSelected: (value) {
            print('on item selected $value $option');
            onSelectItem(value, option);
          },
          selected: type,
        ),
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
            color: Colors.grey.shade400,
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
                onChanged: (changed) {
                  print('changed to $changed');
                  onSelectItem(type, changed);
                },
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
      padding: EdgeInsets.all(0),
      child: Container(
        height: 50.0,
        child: Row(
          children: [textBox(), getOptionWidget()],
        ),
      ),
    );
  }
}
