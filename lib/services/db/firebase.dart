import 'package:cloud_firestore/cloud_firestore.dart';

//singleton class
class FireStore {
  FireStore._privateConstructor();

  static final FireStore _instance = FireStore._privateConstructor();

  factory FireStore() {
    return _instance;
  }

  static final FirebaseFirestore _dbManager = FirebaseFirestore.instance;

  Future<void> create() async {
    await _dbManager.collection("cars").doc().set(
        {
          "brand": "Genesis",
          "name": "G70",
          "price": 5000,
        },);
  }

  void read() {}

  void delete() {}
}
