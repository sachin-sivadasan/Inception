import 'package:flutter/material.dart';
import 'package:inception/model/conver_model.dart';
import 'package:inception/model/unit_model.dart';
import 'package:inception/widgets/DropDownView/drop_down.dart';
import 'package:inception/widgets/result_text.dart';
import 'package:inception/widgets/unit_card.dart';
import '../../widgets/TextBar/TextBar.dart';
import '../../Transform/Transform.dart';

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
    value = value.isEmpty ? '0' : value;
    this.setState(() {
      _selectedTypeFrom = type;
      _currentValue = BigInt.from(int.parse(value));
      calculateResult();
    });
  }

  Widget getResultView() {
    if (_results.isEmpty ||
        _currentValue == null ||
        _currentValue.toString() == '0') {
      return Container();
    }
    return ResultText(_currentResult);
  }

  Widget listView() {
    if (_results.isEmpty ||
        _currentValue == null ||
        _currentValue.toString() == '0') {
      return Container();
    }

    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
    print('result=======${convertModel.toSelectedConvertion()}');
    setState(() {
      _currentResult = result;
      _results = allResults;
    });
  }

  Widget getToColapsedView() {
    return Container(
      padding: EdgeInsets.only(left: 15),
      foregroundDecoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'convert to $_selectedTypeTo',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            IntrinsicWidth(
              child: DropDownView(
                  entries: entries,
                  selected: _selectedTypeTo,
                  onItemSelected: (value) {
                    setState(() {
                      _selectedTypeTo = value;
                      calculateResult();
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: '#2D198F'.toHexColor(),
          shadowColor: Colors.transparent,
          title: Text('Byte Converter'),
        ),
        body: Container(
          color: '#2D198F'.toHexColor(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      child: TextBar(
                          onSelectItem: onPressOption,
                          onChnageText: onPressOption,
                          type: _selectedTypeFrom,
                          option: _currentValue.toString(),
                          leftText: 'From',
                          keyboard: TextInputType.phone),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: getToColapsedView()),
                    Container(
                      width: _media.width,
                      margin: EdgeInsets.only(top: 25.0),
                      child: getResultView(),
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
