import 'package:flutter/material.dart';
import 'package:inception/network/firebase_api.dart';

class AddNewPooja extends StatefulWidget {
  @override
  _AddNewPoojaState createState() => _AddNewPoojaState();
}

class _AddNewPoojaState extends State<AddNewPooja> {
  String poojaName;

  String selectedCost;

  String rrr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Pooja"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Type Name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10)),
                onChanged: (value) {
                  this.setState(() {
                    poojaName = value;
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
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue, primary: Colors.white),
                      onPressed: () {
                        FirebaseAPI.addNewPooja(poojaName, selectedCost);
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