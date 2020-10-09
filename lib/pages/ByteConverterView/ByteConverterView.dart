import 'package:flutter/material.dart';
import '../../widgets/TextBar/TextBar.dart';

class ConverterView extends StatefulWidget {
  @override
  _ConverterViewState createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {
  var option = 'MB';

  onPressOption() {
    this.setState(() {
      option = 'GB';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Byte Converter'),
        ),
        body: TextBar(onTap: onPressOption, option: option, leftText: 'From'));
  }
}
