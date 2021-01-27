import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/Button/button.dart';
import '../../widgets/ImageButton/image_button.dart';
import '../../Transform/Transform.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class LandingView extends StatelessWidget {
  goTo(BuildContext ctx) {
    var fir = FirebaseAnalytics();
    fir.logEvent(name: 'purushu', parameters: {'sachin': 'karunahapally'});
    Navigator.pushNamed(ctx, '/converter');
  }

  goToCurrencyView(BuildContext ctx) {
    Navigator.pushNamed(ctx, '/currency');
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
    var memoryButton =
        Button(() => goTo(context), 'Memory Converter', 'elivated');
    var currencyButton = Button(
        () => goToCurrencyView(context), 'Currency Converter', 'elivated');
    return Scaffold(
      // drawer: Container(
      //   color: Colors.white,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Container(
      //         height: 200,
      //         color: Colors.blueAccent[700],
      //         child: Text('dsdsdds dgfgs gsgs  gsddsd'),
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        title: Text('Home Sweet Home'),
        actions: [settingsAction(context)],
        backgroundColor: '#2D198F'.toHexColor(),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: '#2D198F'.toHexColor(),
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [memoryButton, currencyButton],
          ),
        ),
      ),
    );
  }
}
