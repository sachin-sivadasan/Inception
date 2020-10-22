import 'package:flutter/material.dart';

class DropDownView extends StatefulWidget {
  final List<String> entries;
  final Function(String) onItemSelected;
  String selected;
  Color bgColor;

  DropDownView(
      {this.entries, this.onItemSelected, this.selected, this.bgColor});

  @override
  _DropDownViewState createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  List<DropdownMenuItem<String>> _dropdownItems  = new List();

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < widget.entries.length; i++) {
      items.add(DropdownMenuItem(
          value: widget.entries[i], child: new Text(widget.entries[i])));
    }
    if (widget.selected.isEmpty) widget.selected = items[0].value;
    return items;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("building2....");
    _dropdownItems = getDropDownItems();
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: (widget.bgColor != null) ? widget.bgColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(6.0)),
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: DropdownButton(
              isExpanded: true,
              items: _dropdownItems,
              onChanged: onItemSelected,
              value: widget.selected,
              underline: Container())),
    );
  }

  void onItemSelected(String value) {
    setState(() {
      widget.selected = value;
      widget.onItemSelected(value);
    });
  }
}
