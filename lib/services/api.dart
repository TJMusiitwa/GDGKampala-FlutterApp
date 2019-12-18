import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:google_dev_group_kampala/models/events_model.dart';

class API {
  static final Firestore _firestoreDB = Firestore.instance;
  final String path;
  CollectionReference reference;

  API(this.path) {
    reference = _firestoreDB.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return reference.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return reference.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return reference.document(id).get();
  }

  Future<void> removeDocument(String id) {
    return reference.document(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return reference.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return reference.document(id).updateData(data);
  }

  //Get events subcollection
  //Stream<Event> eventCollection
}
