import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ByteConverterView/ByteConverterView.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Sweet Home'),
      ),
      body: Container(
          child: Center(
        child: IntrinsicWidth(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Text('conerter =>'),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ByteConverterView()),
                );
              },
            ),
          ],
        )),
      )),
    );
  }
}
