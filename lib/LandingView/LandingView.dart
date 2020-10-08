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
          padding: EdgeInsets.all(16.0) ,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  child: Text('Byte Converter'),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ByteConverterView()),
                    );
                  },
                ),
              ],
            ),
      )),
    );
  }
}
