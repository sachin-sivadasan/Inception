import 'package:flutter/material.dart';

class ByteConverterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Byte Converter'),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

class ConverterView extends StatefulWidget {
  @override
  _ConverterViewState createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Byte Converter'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: 7.0, bottom: 7.0, left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0)),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: '1000 KB',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      )),
                  keyboardType: TextInputType.number),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
              child: Text("1024 MB"),
            )
          ],
        ),
      ),
    );
  }
}
