import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Sweet Home'),
      ),
      body: Container(
        child: Text('I am the body not bra Body'),
      ),
    );
  }
}
