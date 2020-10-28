import 'package:flutter/material.dart';

extension HexColor on String {
  Color toHexColor({int opacity}) {
    // var hexOpacity = int.parse('256', radix: 16);
    // ignore: division_optimization
    // int.parse(((256 * (opacity * 10)) / 100).toInt().toString(), radix: 16);
    return Color(
        // int.parse('FF${hexColor.toString().replaceFirst('#', '')}', radix: 16));
        int.parse('FF${this.toString().replaceFirst('#', '')}', radix: 16));
  }
}
