import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inception/widgets/DropDownView/drop_down.dart';

class TextBar extends StatelessWidget {
  final Function(String, String)? onSelectItem;
  final Function(String, String)? onChnageText;
  final leftText;
  String option = '';
  String type = '';
  TextInputType? keyboard = TextInputType.phone;
  TextBar({
    this.onSelectItem,
    required this.type,
    required this.option,
    this.leftText,
    this.onChnageText,
    this.keyboard,
  });

  List<String> entries = <String>['Bytes', 'KB', 'MB', 'GB', 'TB'];
  Widget getOptionWidget() {
    print('option $option, type $type');
    if (option == null) return Container();
    return Container(
      child: IntrinsicWidth(
        child: DropDownView(
          entries: entries,
          onItemSelected: (value) {
            print('on item selected $value $option');
            onSelectItem?.call(value, option);
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
        margin: EdgeInsets.only(right: 5),
        child: Row(children: [
          leftLabel(),
          Expanded(
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter value',
                    hintStyle: TextStyle(fontSize: 16, color: Colors.white54),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
                keyboardType: Platform.isIOS
                    ? TextInputType.datetime
                    : TextInputType.phone,
                textInputAction: TextInputAction.done,
                style: TextStyle(fontSize: 16, color: Colors.white),
                cursorColor: Colors.white,
                onChanged: (changed) {
                  print('changed to $changed');
                  onChnageText?.call(type, changed);
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
                width: 2, style: BorderStyle.solid, color: Colors.white),
          ),
          height: 50.0,
          child: Row(
            children: [textBox(), getOptionWidget()],
          ),
        ),
      ),
    );
  }
}
