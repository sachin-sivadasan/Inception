import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:inception/model/pooja_detail.dart';
import 'package:inception/network/firebase_api.dart';
import 'package:inception/widgets/DropDownView/drop_down.dart';
import 'package:inception/widgets/TextBar/TextBar.dart';
import 'package:inception/widgets/result_text.dart';

class CurrencyConverterView extends StatefulWidget {
  CurrencyConverterView();

  @override
  _CurrencyConverterViewState createState() => _CurrencyConverterViewState();
}

class _CurrencyConverterViewState extends State<CurrencyConverterView> {
  Query _query;

  @override
  void initState() {
    FirebaseAPI.queryRates().then((Query value) {
      setState(() {
        _query = value;
      });
    });
//    FirebaseAPI.addPooja(PoojaDetail("ss", "poojaC", "15-10-2020", "100"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            StreamBuilder<DataSnapshot>(
              stream: _query.once().asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('error in reading stream');
                  return Container();
                } else {
                  Widget child;
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      child = Container(child: Text('ConnectionState.waiting'));
                      break;
                    case ConnectionState.none:
                      child = Container(child: Text('ConnectionState.none'));
                      break;
                    case ConnectionState.active:
                      child = Container(child: Text('ConnectionState.active'));
                      break;
                    case ConnectionState.done:
                      List<String> entries = List();
                      snapshot.data.value
                          .forEach((key, value) => {entries.add(key)});
                      child = Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Container(
                                  child: TextBar(
                                      type: "KB",
                                      option: '1000',
                                      leftText: 'From')),
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                child: DropDownView(
                                    bgColor: Colors.grey.shade200,
                                    entries: entries,
                                    selected: entries[0],
                                    onItemSelected: (value) {}),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12.0),
                                child: ResultText("0000"),
                              )
                            ],
                          ));
                      break;
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [child],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
