import 'package:clean_me/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  final String _location = "ghatkopar";
  final String _address = "asalfa";

  // @override
  // void initState() {
  //   getPrefs();
  //   super.initState();
  // }

  // getPrefs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String location = prefs.getString("location");
  //   print(location);
  //   String address = prefs.getString("address");
  //   print(address);
  //   setState(() {
  //     _location = location;
  //     _address = address;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final locationData = Provider.of<LocationProvider>(context);
    final authentication = Provider.of<AuthenticationProvider>(context);

    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 2,
      floating: true,
      snap: true,
      title: TextButton(
        onPressed: () {
          // locationData.getCurrentPosition().then((value) {
          //   if (value != null)
          //     pushNewScreen(
          //       context,
          //       screen: MapScreen(),
          //       withNavBar: false,
          //       pageTransitionAnimation: PageTransitionAnimation.cupertino,
          //     );
          //   else
          //     print("Permission not allowed");
          // });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    _location == null ? "Address not set" : _location,
                    style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.edit_outlined,
                  color: Colors.black87,
                  size: 17,
                ),
              ],
            ),
            Flexible(
              child: Text(
                _address == null ? "Press here to set Delivery Location" : _address,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black87, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.power_settings_new),
          onPressed: () {
            authentication.signOut();
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: Colors.white),
          ),
        ),
      ),
    );
  }
}
