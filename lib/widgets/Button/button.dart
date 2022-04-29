import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @required
  final onpress;
  @required
  final String text;
  final String type;
  Button(this.onpress, this.text, this.type);
  @override
  Widget build(BuildContext context) {
    if (type == 'texted') {
      var textButton = TextButton(
        onPressed: onpress,
        child: Text(text),
      );
      return Container(
        padding: EdgeInsets.all(16.0),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textButton,
            ],
          ),
        ),
      );
    }

    if (type == 'outlined') {
      var outlinedButton = OutlinedButton(
        onPressed: onpress,
        child: Text(text),
      );
      return Container(
        padding: EdgeInsets.all(16.0),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              outlinedButton,
            ],
          ),
        ),
      );
    }

    var elevatedButton = ElevatedButton(
      onPressed: onpress,
      child: Text(text),
    );
    return Container(
      padding: EdgeInsets.all(16.0),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            elevatedButton,
          ],
        ),
      ),
    );
  }
}
