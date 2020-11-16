import 'package:flutter/material.dart';
import 'package:inception/model/unit_model.dart';
import '../Transform/Transform.dart';

class UnitCardView extends StatefulWidget {
  UnitModel model;

  UnitCardView(this.model);

  @override
  _UnitCardViewState createState() => _UnitCardViewState();
}

class _UnitCardViewState extends State<UnitCardView> {
  @override
  Widget build(BuildContext context) {
    Widget renderTitle() {
      return Container(
          margin: EdgeInsets.only(right: 5.0),
          child: Text(
              widget.model.from.toUpperCase() +
                  ' TO ' +
                  widget.model.title.toUpperCase(),
              style: TextStyle(color: Colors.white)));
    }

    Container renderResult() {
      return Container(
        margin: EdgeInsets.only(top: 5.0),
        child: Text(
          widget.model.from + ' = ' + widget.model.result,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    }

    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      border: Border.all(width: 1, color: '#3D24A9'.toHexColor()),
      color: Colors.white,
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.3,
            0.85,
            1.0,
          ],
          colors: [
            '#2E3094'.toHexColor(),
            '#2D1398'.toHexColor(),
            '#32179F'.toHexColor()
          ]),
    );

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 20),
      decoration: boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [renderTitle(), renderResult()],
      ),
    );
  }
}
