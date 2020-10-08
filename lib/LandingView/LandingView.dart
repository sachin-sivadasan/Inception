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

  goToSettings(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (ctx) => SettingsView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var button = Button(() => goTo(context), 'I am a component', 'raised');
    var settingsBUtton =
        Button(() => goToSettings(context), 'Settings', 'raised');
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
              children: [button, settingsBUtton],
            ),
          )),
    );
  }
}
