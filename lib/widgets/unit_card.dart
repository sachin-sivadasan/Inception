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
    Widget renderTitle() {
      return Row(
        children: [
          Container(
              margin: EdgeInsets.only(right: 5.0),
              child: Text(widget.model.from.toString())),
          Container(child: Text(widget.model.title)),
        ],
      );
    }

    Container renderResult() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 5.0),
        child: Text(widget.model.result),
      );
    }

    var boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black38,
          ),
        ]);

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(10),
      decoration: boxDecoration,
      child: Column(
        children: [renderTitle(), renderResult()],
      ),
    );
  }
}
