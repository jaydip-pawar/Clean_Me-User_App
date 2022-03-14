import 'package:clean_me/screens/home/widgets/gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "George Thomas",
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Text(
                    '168 ',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                  Text(
                    'Problems Posted',
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/cool.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black87,
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 13,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: const [
                  Text(
                    '40 ',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                  Text(
                    'Problems Resolved',
                  ),
                ],
              ),
            ],
          ),
          const Text(
            'LEVEL 5',
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: LinearPercentIndicator(
              width: 180.0,
              //lineWidth: 15.0,
              lineHeight: 15,
              percent: 50 / 100,
              animation: true,
              animationDuration: 2000,
              leading: const Text(
                "50%",
                style: TextStyle(fontSize: 20),
              ),
              trailing: const Text(
                "150/300",
                style: TextStyle(fontSize: 20, color: Colors.blueGrey),
              ),
              progressColor: Colors.blueGrey,
            ),
          ),
          Flexible(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 1.0,
              ),
              children: [
                Gallery(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
