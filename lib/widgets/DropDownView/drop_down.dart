import 'package:flutter/material.dart';

import '../../Transform/Transform.dart';

class DropDownView extends StatefulWidget {
  final List<String> entries;
  final Function(String) onItemSelected;
  String selected;
  Color? bgColor;

  DropDownView({
    required this.entries,
    required this.onItemSelected,
    required this.selected,
    this.bgColor,
  });

  @override
  _DropDownViewState createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  List<DropdownMenuItem<String>>? _dropdownItems;

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < widget.entries.length; i++) {
      items.add(DropdownMenuItem(
        value: widget.entries[i],
        child: new Text(widget.entries[i]),
      ));
    }
    if (widget.selected.isEmpty) widget.selected = items[0].value ?? '';
    return items;
  }

  @override
  void initState() {
    _dropdownItems = getDropDownItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [getBgImage(), getdropDownColapsedView()]);
  }

  Widget getBgImage() {
    if (widget.bgColor != null) return Container();
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      top: 0.0,
      child: Image(
        image: AssetImage('assets/drop_down.png'),
        fit: BoxFit.fill,
      ),
    );
  }

  Container getdropDownColapsedView() {
    return Container(
      height: 50,
      decoration: getBoxdecoration(),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: DropdownButton(
          style: TextStyle(color: Colors.white),
          dropdownColor: '#C90090'.toHexColor(),
          iconEnabledColor: Colors.white,
          isExpanded: true,
          items: _dropdownItems,
          onChanged: onItemSelected,
          value: widget.selected,
          underline: Container(),
        ),
      ),
    );
  }

  BoxDecoration? getBoxdecoration() {
    if (widget.bgColor == null) return null;
    return BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        color: (widget.bgColor != null) ? widget.bgColor : null);
  }

  void onItemSelected(String? value) {
    if (value != null) {
      setState(() {
        widget.selected = value;
        widget.onItemSelected(value);
      });
    }
  }
}
