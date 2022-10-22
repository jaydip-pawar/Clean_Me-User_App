import 'package:clean_me/constants.dart';
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
    bool _first = false;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: height(context) * 0.28,
            child: const MyGoogleMap(),
          ),
          Positioned.fill(
            child: DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.345,
              initialChildSize: 0.37,
              builder: (ctx, controller) {
                return Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Colors.white,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: ComplaintService().complaints,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        Map nearbyComplaints = snapshot.data!.docs.asMap();
                        return ListView.builder(
                          controller: controller,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            if(index == 0 || _first == true) {
                              if (locationProvider.getDistance(nearbyComplaints[index]["location"]) <= 2) {
                                _first = false;
                                return ComplaintList(
                                  image: nearbyComplaints[index]["image"],
                                  address: nearbyComplaints[index]["address"],
                                  startLatitude: locationProvider.latitude,
                                  startLongitude: locationProvider.longitude,
                                  endLatitude: nearbyComplaints[index]["location"].latitude,
                                  endLongitude: nearbyComplaints[index]["location"].longitude,
                                  isFirst: true,
                                );
                              } else {
                                _first = true;
                              }
                            } else {
                              if (locationProvider.getDistance(nearbyComplaints[index]["location"]) <= 2) {
                                return ComplaintList(
                                  image: nearbyComplaints[index]["image"],
                                  address: nearbyComplaints[index]["address"],
                                  startLatitude: locationProvider.latitude,
                                  startLongitude: locationProvider.longitude,
                                  endLatitude: nearbyComplaints[index]["location"].latitude,
                                  endLongitude: nearbyComplaints[index]["location"].longitude,
                                  isFirst: false,
                                );
                              }
                            }
                            return Container();
                          },
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
