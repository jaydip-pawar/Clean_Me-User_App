import 'package:clean_me/models/google_map.dart';
import 'package:clean_me/screens/home/widgets/complaint_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          const MyGoogleMap(),
          Flexible(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const ComplaintList();
              },
            ),
          )
        ],
      ),
    );
  }
}
