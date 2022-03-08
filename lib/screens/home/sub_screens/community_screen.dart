import 'package:clean_me/constants.dart';
import 'package:clean_me/models/animated_fab.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Community Screen"),
    );
  }
}
