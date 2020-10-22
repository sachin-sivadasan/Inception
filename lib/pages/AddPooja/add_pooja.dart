import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inception/model/pooja_detail.dart';
import 'package:inception/network/firebase_api.dart';
import 'package:inception/widgets/DropDownView/drop_down.dart';

class AddPooja extends StatefulWidget {
  @override
  _AddPoojaState createState() => _AddPoojaState();
}

class _AddPoojaState extends State<AddPooja> {
  String selectedDate = "";
  String _selectedName = "";
  String selectedAddress = "";
  String selectedCost = "";
  Query _query;
  List<String> _entries = List();

  @override
  void initState() {
    super.initState();
    FirebaseAPI.queryPoojas().then((Query value) {
      setState(() {
        _query = value;
        _query.once().asStream().listen((DataSnapshot snapshot) {
          List<String> entries = List();
          snapshot.value.forEach((key, pooja) {
            entries.add(pooja["name"]);
          });
          setState(() {
            _entries.addAll(entries);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("building....${_entries.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Pooja"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: DropDownView(
                    bgColor: Colors.grey.shade200,
                    entries: _entries.isEmpty? ["Select"] : _entries,
                    selected: _entries.isEmpty? "Select" : _selectedName,
                    onItemSelected: (value) {
                      this.setState(() {
                        _selectedName = value;
                      });
                    })),
            Container(
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Type Address',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10)),
                onChanged: (value) {
                  this.setState(() {
                    selectedAddress = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Type Cost',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10)),
                onChanged: (value) {
                  this.setState(() {
                    selectedCost = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 45,
                        child: GestureDetector(
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2020, 12, 10))
                                  .then((value) => {
                                        this.setState(() {
                                          selectedDate = value.toString();
                                        })
                                      });
                            },
                            child: Center(
                                child: Text(
                                    "${this.selectedDate.isNotEmpty ? this.selectedDate : "Select Date"}")))),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue, primary: Colors.white),
                      onPressed: () {
                        var model = PoojaDetail(
                            poojaName: _selectedName,
                            poojaDate: selectedDate,
                            poojaAmount: selectedCost,
                            personName: "");
                        FirebaseAPI.addPooja(model);
                      },
                      child: Text("Submit"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
