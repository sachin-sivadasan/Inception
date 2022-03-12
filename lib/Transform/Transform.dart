import 'package:flutter/material.dart';

extension HexColor on String {
  Color toHexColor({int? opacity}) {
    assert((opacity == null || opacity <= 10 && opacity >= 0),
        'opacity range should be in 0 - 10');
    var hex = this.length <= 7 && opacity == null ? 'FF' : '';
    hex = (this.length <= 7 && opacity != null)
        // ignore: division_optimization
        ? (((256 * (opacity * 10)) / 100).toInt()).toRadixString(16)
        : hex;
    return Color(
        // int.parse('FF${hexColor.toString().replaceFirst('#', '')}', radix: 16));
        int.parse('$hex${this.toString().replaceFirst('#', '')}', radix: 16));
  }
}
