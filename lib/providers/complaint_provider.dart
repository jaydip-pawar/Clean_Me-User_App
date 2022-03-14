import 'dart:io';

import 'package:clean_me/providers/location_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ComplaintProvider with ChangeNotifier {

  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  void _addComplaintData(
      String url, GeoPoint location, String address) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("complaints").doc(firebaseUser!.uid).set({
      "address": address,
      "image": url,
      "location": location,
    }).then((_) {
      EasyLoading.showSuccess("Complaint registered");
    }).catchError((error) => print("Failed to add user: $error"));
  }

  void uploadImage(LocationProvider locationProvider) async {

    await _picker
        .pickImage(
        source: ImageSource.camera,
        imageQuality: 30
    )
        .then((value) async {
      EasyLoading.show(status: "Uploading...");
      try {
        await _storage.ref("Complaints/${value!.name}").putFile(
          File(value.path),
        );
        Reference ref = FirebaseStorage.instance.ref().child("Complaints/${value.name}");
        await ref.getDownloadURL().then((url) async {
          await locationProvider.getGeoPoint().then((geoPoint) async {
            String address = locationProvider.getSAddress(locationProvider.address.streetAddress);
            _addComplaintData(url, geoPoint, address);
          });
        });
      } on FirebaseException catch (error) {
        EasyLoading.showError("Try Again...");
        if (kDebugMode) {
          print(error);
        }
      } catch (err) {
        EasyLoading.showError("Something went wrong!");
        if (kDebugMode) {
          print(err);
        }
      }
    });
  }

}