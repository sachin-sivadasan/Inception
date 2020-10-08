import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import './SplashScreen/SplashScreen.dart';
import './LandingView/LandingView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LandingView(),
    );
  }
}
