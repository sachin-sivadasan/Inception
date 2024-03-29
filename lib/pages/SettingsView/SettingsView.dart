import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Transform/Transform.dart';
import '../../widgets/Button/button.dart';

class SettingsView extends StatelessWidget {
  // click listener for share button.
  onShareClick() async {
    print("clicked share button");
    handleShare();
  }

  // click listener for review button.
  onReviewClick() {
    print('clicked review button');
    handleReview();
  }

  handleShare() async {
    const url = 'https://codebreakers.page.link/converter';
    Share.share(url);
  }

  handleReview() async {
    // TODO:- should handle iOS to open App Store
    const url = 'market://details?id=com.flipkart.android';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // if failed to open playstore app, then launch the web link.
      const url =
          'https://play.google.com/store/apps/details?id=com.flipkart.android';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        Fluttertoast.showToast(
            msg: "Could not open",
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: '#2D198F'.toHexColor(),
        shadowColor: Colors.transparent,
        title: Text('Settings'),
      ),
      body: Container(
        color: '#2D198F'.toHexColor(),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Button(onShareClick, 'Share', 'elevated'),
            Button(onReviewClick, 'Add Review', 'elevated')
          ],
        ),
      ),
    );
  }
}
