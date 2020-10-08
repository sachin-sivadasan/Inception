import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              child: Text("Share"),
              onPressed: onShareClick,
            ),
            ElevatedButton(
              child: Text("Add Review"),
              onPressed: onReviewClick,
            )
          ],
        ),
      ),
    );
  }

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
    const url = 'market://details?id=com.flipkart.android'; // TODO:- should handle iOS to open App Store.
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // if failed to open playstore app, then launch the web link.
      const url = 'https://play.google.com/store/apps/details?id=com.flipkart.android';
      if (await canLaunch(url)) {
        await launch(url);
      }else {
        Fluttertoast.showToast(
            msg: "Could not open",
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT);
      }
    }
  }

}
