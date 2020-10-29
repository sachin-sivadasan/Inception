import 'package:flutter/material.dart';

extension HexColor on String {
  Color toHexColor({int opacity}) {
//    assert (opacity < 10);
//     var hexOpacity = int.parse('256', radix: 16);
    // ignore: division_optimization
    var hex = (((256 * (opacity * 10)) / 100).toInt()).toRadixString(16);
    return Color(
        // int.parse('FF${hexColor.toString().replaceFirst('#', '')}', radix: 16));
        int.parse('$hex${this.toString().replaceFirst('#', '')}', radix: 16));
  }
}