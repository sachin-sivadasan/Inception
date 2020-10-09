import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './SplashScreen/SplashScreen.dart';
import './LandingView/LandingView.dart';
import './SettingsView/SettingsView.dart';
import './ByteConverterView/ByteConverterView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of Our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
      routes: {
        '/landingView': (context) => LandingView(),
        '/converter': (context) => ByteConverterView(),
        '/settings': (context) => SettingsView(),
      },
    );
  }
}
