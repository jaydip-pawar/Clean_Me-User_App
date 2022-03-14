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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "George Thomas",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child:
                Text(
                  '168 ',
                  style: TextStyle(fontSize: 20, color: Colors.black87),

                ),
              ),
            ],

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child:
                Text(
                  'Problems Posted',
                ),
              ),
            ],

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child:
                Text(
                  '40 ',
                  style: TextStyle(fontSize: 20, color: Colors.black87),

                ),
              ),
            ],

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child:
                Text(
                  'Problems Resolved',
                ),
              ),
            ],

          ),

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



          Padding(
            padding: const EdgeInsets.only(),
            child: CircleAvatar(

              backgroundColor: Colors.black54,
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child:
                Text(
                  'LEVEL 5',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ),
            ],

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
              )),

      Expanded(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,

          ),
          children: [
            Gallery(),
          ],
        ),
      ),
  ]),
    );
  }
}
