import 'package:clean_me/constants.dart';
import 'package:clean_me/providers/location_provider.dart';
import 'package:clean_me/screens/home/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(37, -122), zoom: 50);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: Container(
        height: height(context) * 0.6,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: markers,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
            Align(
              alignment: const Alignment(0.9, 0.8),
              child: IconButton(
                icon: const Icon(
                  Icons.my_location_sharp,
                  size: 40,
                ),
                onPressed: () {
                  googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(
                          locationProvider.latitude,
                          locationProvider.longitude,
                        ),
                        zoom: 14,
                      ),
                    ),
                  );
                  markers.clear();
                  markers.add(
                    Marker(
                      markerId: const MarkerId("currentLocation"),
                      position: LatLng(
                        locationProvider.latitude,
                        locationProvider.longitude,
                      ),
                    ),
                  );
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
