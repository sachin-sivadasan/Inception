import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inception/pages/experiments/pages/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(
    () => {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError,
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of our application.
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    analytics.setAnalyticsCollectionEnabled(true);
    return MaterialApp(
      title: 'Converter App',
      home: Home(),
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
