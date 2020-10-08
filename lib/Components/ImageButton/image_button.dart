import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  @required
  String path;
  @required
  final onPress;
  EdgeInsets padding = EdgeInsets.all(0.0);
  Color bgColor = Colors.red;

  EdgeInsets defaultPadding = EdgeInsets.all(0.0);
  Color defaultBgColor = Colors.transparent;

  ImageButton({this.path, this.onPress, this.padding, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (padding != null) ? padding : defaultPadding,
      color: (bgColor != null) ? bgColor : defaultBgColor,
      child: IconButton(
        icon: Image(image: AssetImage(path)),
        onPressed: onPress,
      ),
    );
  }
}
