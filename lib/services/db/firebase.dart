import 'package:cloud_firestore/cloud_firestore.dart';

//singleton class
class FireStore {
  FireStore._privateConstructor();

  static final FireStore _instance = FireStore._privateConstructor();

  factory FireStore() {
    return _instance;
  }

  static final FirebaseFirestore _dbManager = FirebaseFirestore.instance;

  Future<void> create(a) async {
    await _dbManager.collection("FairyTail").doc().set(a);
  }

  Future<List<Map<String, dynamic>>> read() async {
    QuerySnapshot<Map<String, dynamic>> _snapshot =
        await _dbManager.collection("cars").get();
    List<Map<String, dynamic>> _result =
        _snapshot.docs.map((e) => e.data()).toList();
    return _result;
  }

  void delete() {}
}
