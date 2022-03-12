import 'package:clean_me/models/google_map.dart';
import 'package:clean_me/providers/location_provider.dart';
import 'package:clean_me/screens/home/widgets/complaint_list.dart';
import 'package:clean_me/services/complaint_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyGoogleMap(),
          const Padding(
            padding: EdgeInsets.only(top: 5.0, left: 10, bottom: 5),
            child: Text(
              "Nearby Complaints",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
                stream: ComplaintService().complaints,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView(
                      children: snapshot.data!.docs.map((doc) {
                        return ComplaintList(
                          image: doc.get("image"),
                          address: doc.get("address"),
                          startLatitude: locationProvider.latitude,
                          startLongitude: locationProvider.longitude,
                          endLatitude: doc.get("location").latitude,
                          endLongitude: doc.get("location").longitude,
                        );
                      }).toList(),
                    );
                  }
                },),
          ),
        ],
      ),
    );
  }
}
