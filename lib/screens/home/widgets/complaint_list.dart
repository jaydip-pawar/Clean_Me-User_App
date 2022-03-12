import 'package:clean_me/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class ComplaintList extends StatefulWidget with ChangeNotifier{
  final String image, address;
  final double startLatitude, startLongitude, endLatitude, endLongitude;

  ComplaintList(
      {Key? key,
      required this.image,
      required this.address,
      required this.startLatitude,
      required this.startLongitude,
      required this.endLatitude,
      required this.endLongitude})
      : super(key: key);

  @override
  _ComplaintListState createState() => _ComplaintListState();
}

class _ComplaintListState extends State<ComplaintList> {

  @override
  Widget build(BuildContext context) {

    final locationProvider = Provider.of<LocationProvider>(context);

    Future<double> getDistance() async {
      double _distance = Geolocator.distanceBetween(
        locationProvider.latitude,
        locationProvider.longitude,
        widget.endLatitude,
        widget.endLongitude,
      ) / 1000;
      return double.parse(_distance.toStringAsFixed(2));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 8,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.image),
              ),
            ),
            title: Text(
              widget.address,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            trailing: FutureBuilder(
              future: getDistance(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Text("${snapshot.data} km");
                }
                return const Text("");
              },
            ),
          ),
        ),
      ),
    );
  }
}
