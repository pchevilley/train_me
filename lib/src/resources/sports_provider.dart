import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/sport.dart';

class SportProvider {
  Firestore _firestore = Firestore.instance;

  List<Sport> _sportsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(_sportFromDocument).toList();
  }

  Sport _sportFromDocument(DocumentSnapshot document) {
    return Sport( name: document["name"]);
  }

  Stream<List<Sport>> getSportsList() {
    return _firestore
      .collection("sports")
      .snapshots()
      .map(_sportsFromSnapshot);
  }
}