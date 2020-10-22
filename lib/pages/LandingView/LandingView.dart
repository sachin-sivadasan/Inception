import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/Button/button.dart';
import '../../widgets/ImageButton/image_button.dart';

class LandingView extends StatelessWidget {
  goTo(BuildContext ctx) {
    Navigator.pushNamed(ctx, '/converter');
  }
  goToCurrencyView(BuildContext ctx) {
    Navigator.pushNamed(ctx, '/currency');
  }

  goToAddView(BuildContext ctx) {
    Navigator.pushNamed(ctx, '/add');
  }

  goToAddNewView(BuildContext ctx) {
    Navigator.pushNamed(ctx, '/addPooja');
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
    var currencyButton = Button(() => goToCurrencyView(context), 'Currency Converter', 'elivated');
    var addButton = Button(() => goToAddView(context), 'Currency Converter', 'elivated');
    var addPoojaButton = Button(() => goToAddNewView(context), 'Add', 'elivated');
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
            children: [button, currencyButton, addButton, addPoojaButton],
          ),
        ),
      ),
    );
  }
}
