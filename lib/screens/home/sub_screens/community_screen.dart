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
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
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
              const Icon(Icons.more_vert)
            ],
          ),
        ),
        //post
        Container(
          color: Colors.grey[300],
          child: Image.asset("assets/images/event8.jpg"),
        ),
        //below the post -> buttons and comments
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.favorite),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.chat_bubble_outline),
                  ),
                  Icon(Icons.share),
                ],
              ),
              const Icon(Icons.bookmark),
            ],
          ),
        ),

        //comments
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(children: const [
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
