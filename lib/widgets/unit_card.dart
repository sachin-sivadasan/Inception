import 'package:flutter/material.dart';
import 'package:inception/model/unit_model.dart';

class UnitCardView extends StatefulWidget {

  UnitModel model;

  UnitCardView(this.model);

  @override
  _UnitCardViewState createState() => _UnitCardViewState();
}

class _UnitCardViewState extends State<UnitCardView> {

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Material(
      elevation: 1.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: (_media.width / 3) - 10,
        padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: Text(widget.model.title)),
            SizedBox(
              height: 10.0,
            ),
            Text(widget.model.result)
          ],
        ),
      ),
    );
  }
}
