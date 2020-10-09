import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './pages/SplashScreen/SplashScreen.dart';
import './pages/LandingView/LandingView.dart';
import './pages/SettingsView/SettingsView.dart';
import './pages/ByteConverterView/ByteConverterView.dart';

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
        '/converter': (context) => ConverterView(),
        '/settings': (context) => SettingsView(),
      },
    );
  }
}
