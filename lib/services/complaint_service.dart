import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintService {

  Stream<QuerySnapshot> complaints = FirebaseFirestore.instance.collection("complaints").where("isPublic", isEqualTo: true).snapshots();

}