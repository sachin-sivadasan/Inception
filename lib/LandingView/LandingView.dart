import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/Button/button.dart';
import '../Components/ImageButton/image_button.dart';

class LandingView extends StatelessWidget {
  goTo(BuildContext ctx) {
    Navigator.pushNamed(ctx, '/converter');
  }

  launchSettings(BuildContext context) {
    Navigator.pushNamed(context, '/settings');
  }

  //  layout for logo
  Widget settingsAction(BuildContext context) {
    return ImageButton(
      padding: EdgeInsets.all(8.0),
      path: 'assets/settings_white.png',
      onPress: () => launchSettings(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    var button = Button(() => goTo(context), 'I am a component', 'elivated');
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
            children: [button],
          ),
        ),
      ),
    );
  }
}
