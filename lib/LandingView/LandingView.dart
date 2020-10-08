import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ByteConverterView/ByteConverterView.dart';
import '../Components/Button/button.dart';
import '../SettingsView/SettingsView.dart';

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
        actions: [settingsAction(context)],
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

  //  layout for logo
  Widget settingsAction(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(4.0),
        child: Center(
          child: IconButton(
              icon: Image(
                  image: AssetImage('assets/settings_white.png')),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsView()),
                );
              }),
        ));
  }
}
