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
  BigInt _currentValue = BigInt.from(0);
  String _selectedTypeFrom = 'Bytes';
  String _currentResult = '';
  String _selectedTypeTo = 'KB';
  List<String> entries = <String>['Bytes', 'KB', 'MB', 'GB'];
  List<UnitModel> _results = <UnitModel>[];

  onPressOption(String type, String value) {
    this.setState(() {
      _selectedTypeFrom = type;
      _currentValue = BigInt.from(int.parse(value));
      calculateResult();
    });
  }

  Widget listView() {
    if (_results.isEmpty) return Container();

    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: ListView.builder(
        shrinkWrap: true,
        // padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        itemCount: _results.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTypeTo = _results[index].title;
                calculateResult();
              });
            },
            child: UnitCardView(_results[index]),
          );
        },
      ),
    );
  }

  /* calculating result */
  calculateResult() {
    print(
        'calculating result $_currentValue $_selectedTypeFrom $_selectedTypeTo');
    var convertModel =
        ConvertModel(_currentValue, _selectedTypeFrom, _selectedTypeTo);
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
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.indigo[900], Colors.blue[800]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                        child: TextBar(
                            onSelectItem: onPressOption,
                            type: _selectedTypeFrom,
                            option: _currentValue.toString(),
                            leftText: 'From')),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: DropDownView(
                          bgColor: Colors.grey.shade200,
                          entries: entries,
                          selected: _selectedTypeTo,
                          onItemSelected: (value) {
                            setState(() {
                              _selectedTypeTo = value;
                              calculateResult();
                            });
                          }),
                    ),
                    Container(
                      width: _media.width,
                      margin: EdgeInsets.only(top: 12.0),
                      child: ResultText(_currentResult),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child:
                      Align(alignment: Alignment.topCenter, child: listView()))
            ],
          ),
        ));
  }
}
