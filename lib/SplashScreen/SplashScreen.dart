import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// splash screen
class SplashScreen extends StatelessWidget {
  //  layout for logo
  final Widget logoView = Expanded(
    child: Center(
      child:
          Image(image: AssetImage('assets/logo.png'), width: 200, height: 200),
    ),
  );

  // layout for version number
  final Widget versionView = Container(
    padding: const EdgeInsets.all(10),
    child: Text("Version 1.0.0", softWrap: true),
  );

  @override
  Widget build(BuildContext context) {
    launchLandingView(context);
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          children: <Widget>[logoView, versionView],
        ),
      ),
    );
  }

  launchLandingView(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/landingView');
    });
  }
}
