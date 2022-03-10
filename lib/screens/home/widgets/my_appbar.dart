import 'package:clean_me/constants.dart';
import 'package:clean_me/providers/authentication_provider.dart';
import 'package:clean_me/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final authentication = Provider.of<AuthenticationProvider>(context);
    final locationProvider = Provider.of<LocationProvider>(context);

    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Icon(Icons.my_location_sharp),
              ),
              FutureBuilder(
                future: locationProvider.getUserCurrentLocation(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      width: width(context) * 0.6,
                      child: Text(
                        locationProvider.address.streetAddress == null
                            ? "Loading Location"
                            : "${locationProvider.address.streetAddress}",
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                      ),
                    );
                  } else {
                    return const Text("Loading Location");
                  }
                },
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.power_settings_new),
                onPressed: () {
                  authentication.signOut();
                },
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
