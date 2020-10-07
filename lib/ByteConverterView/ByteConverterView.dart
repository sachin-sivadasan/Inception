import 'package:flutter/material.dart';

class ByteConverterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Byte Converter'),
        leading: FlatButton(
          child: Text('<='),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Text('covertarane converter'),
    );
  }
}
