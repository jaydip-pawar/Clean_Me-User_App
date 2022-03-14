import 'package:clean_me/constants.dart';
import 'package:clean_me/popup_menuitems/about_us.dart';
import 'package:clean_me/providers/authentication_provider.dart';
import 'package:clean_me/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final authentication = Provider.of<AuthenticationProvider>(context);

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
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // TODO: Navigate to Notification Screen
                },
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 3, right: 10),
                          child: Icon(Icons.info_outlined),
                        ),
                        Text("About us")
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 3, right: 10),
                          child: Icon(Icons.contact_page_outlined),
                        ),
                        Text("Contact us")
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 3, right: 10),
                          child: Icon(Icons.star_border),
                        ),
                        Text("Rate us")
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 3, right: 10),
                          child: Icon(Icons.help_outline),
                        ),
                        Text("Help")
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 4,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 3, right: 10),
                          child: Icon(Icons.logout),
                        ),
                        Text("Logout")
                      ],
                    ),
                  ),
                ],
                onSelected: (item) => {
                  if (item == 0)
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUs()),
                      )
                    }
                  else if (item == 1)
                    {
                      //TODO: Navigate To Contact us
                    }
                  else if (item == 2)
                    {
                      //TODO: Navigate To Rate us
                    }
                  else if (item == 3)
                    {
                      //TODO: Navigate To Help
                    }
                  else
                    {authentication.signOut()}
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
