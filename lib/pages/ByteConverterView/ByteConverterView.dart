import 'package:flutter/material.dart';
import 'package:inception/model/conver_model.dart';
import 'package:inception/model/unit_model.dart';
import 'package:inception/widgets/DropDownView/drop_down.dart';
import 'package:inception/widgets/result_text.dart';
import 'package:inception/widgets/unit_card.dart';
import '../../widgets/TextBar/TextBar.dart';

class ConverterView extends StatefulWidget {
  @override
  _ConverterViewState createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {
  var option = 'MB';
  String _currentValue = '10000000000';
  String _selectedTypeFrom = 'KB';
  String _currentResult = '';
  String _selectedTypeTo = 'KB';
  List<String> entries = <String>['KB', 'MB', 'GB'];
  List<UnitModel> _results = <UnitModel>[];

  onPressOption() {
    this.setState(() {
      option = 'GB';
    });
  }

  Widget listView() {
    if (_results.isEmpty) return Container();

    return ListView.builder(
      itemCount: _results.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTypeTo = _results[index].title;
                  calculateResult();
                });
              },
              child: UnitCardView(_results[index])),
        );
      },
    );
  }

  /* calculating result */
  calculateResult() {
//    var from = (_currentValue.isEmpty) ? 0 : int.parse(_currentValue);
    var convertModel = ConvertModel(BigInt.from(40404040404040), _selectedTypeTo);
    String result = convertModel.toSelectedConvertion();
    List<UnitModel> allResults = convertModel.toAllConvertions();
    setState(() {
      _currentResult = result;
      _results = allResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Byte Converter'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                  child: TextBar(
                      onTap: onPressOption, option: option, leftText: 'From')),
              Container(
                  margin: EdgeInsets.only(top: 40),
                  child: DropDownView(
                      entries: entries,
                      selected: _selectedTypeTo,
                      onItemSelected: (value) {
                        setState(() {
                          _selectedTypeTo = value;
                          calculateResult();
                        });
                      })),
              Container(
                width: _media.width,
                margin: EdgeInsets.only(top: 10.0),
                child: ResultText(_currentResult),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10.0),
                  height: 150,
                  child: listView())
            ],
          ),
        ));
  }
}
