import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ByteConverterView/ByteConverterView.dart';
import '../SettingsView/SettingsView.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ByteConverterView()),
                    );
                  },
                ),
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
