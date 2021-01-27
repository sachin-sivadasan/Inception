import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inception/pages/CurrencyView/currency_converter_view.dart';
import './pages/LandingView/LandingView.dart';
import './pages/SettingsView/SettingsView.dart';
import './pages/ByteConverterView/ByteConverterView.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() =>
      {FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of Our application.
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FirebaseAnalytics().setAnalyticsCollectionEnabled(true);
    return MaterialApp(
      title: 'Converter App',
      home: ConverterView(),
      navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
      routes: {
        // '/landingView': (context) => LandingView(),
        // '/converter': (context) => ConverterView(),
        // '/currency': (context) => CurrencyConverterView(),
        // '/settings': (context) => SettingsView(),
      },
    );
  }
}
