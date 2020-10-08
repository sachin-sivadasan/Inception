import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ByteConverterView/ByteConverterView.dart';
import '../Components/Button/button.dart';

class LandingView extends StatelessWidget {
  goTo(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (ctx) => ByteConverterView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var button = Button(() => goTo(context), 'I am a component');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Sweet Home'),
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                    child: Text('Byte Converter'),
                    color: Colors.blue,
                    onPressed: () => goTo(context)),
                button
              ],
            ),
          )),
    );
  }
}
