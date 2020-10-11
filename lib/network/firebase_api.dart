import 'package:firebase_database/firebase_database.dart';

class FirebaseAPI {
  static Future<Query> queryRates() async {
    //https://byteconverter-4f404.firebaseio.com/
    return FirebaseDatabase().reference().child("exchange").child("rates");
  }
}
