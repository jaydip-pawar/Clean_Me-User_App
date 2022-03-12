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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //proile photo
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Icon(Icons.menu)
            ],
          ),
        ),
        //post
        Container(
          height: 380,
          color: Colors.grey[300],
        ),
        //below the post -> buttons and comments
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.chat_bubble_outline),
                  ),
                  Icon(Icons.share),
                ],
              ),
              Icon(Icons.bookmark),
            ],
          ),
        ),

        //comments
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(children: [
            Text('Liked by'),
            Text(
              'Samarth',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(' and '),
            Text(
              'Others',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ]),
        )
      ],
    );
  }
}
