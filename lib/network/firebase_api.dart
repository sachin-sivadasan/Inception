import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:inception/model/pooja_detail.dart';

class FirebaseAPI {
  static Future<Query> queryRates() async {
    //https://byteconverter-4f404.firebaseio.com/
    return FirebaseDatabase().reference().child("exchange").child("rates");
  }
  static addPooja(PoojaDetail detail) {
    var admin = FirebaseDatabase();
    var id = admin.reference()
        .push().key;
    print("id = $id");
    String json = jsonEncode(detail);
    print("json = ${detail.toJson()}");
    admin.reference()
        .child("pooja")
        .child(detail.poojaName)
        .child(id).set(detail.toJson()).whenComplete(() => {
          print("completed")
    });
  }
  static Future<Query> queryPoojas() async {
    return FirebaseDatabase().reference().child("poojas");
  }

  static void addNewPooja(String name, String cost) {
    var json = {
      'name': name,
    'cost': cost
  };
    var poojas_table = FirebaseDatabase().reference().child("poojas");
    String key = poojas_table.push().key;
    poojas_table.child(key)
        .set(json).whenComplete(() => {
    });
  }
}