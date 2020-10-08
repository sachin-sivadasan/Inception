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
          child: Center(
        child: IntrinsicWidth(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                child: Text('conerter =>'),
                color: Colors.blue,
                onPressed: () => goTo(context)),
            button
          ],
        )),
      )),
    );
  }
}
