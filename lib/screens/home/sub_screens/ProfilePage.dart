import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
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
            'Jaydip Riyaz Ahmadullah',
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 5.0),
                child: Text(
                  "Lvl. 5",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Flexible(
                child: LinearPercentIndicator(
                  //lineWidth: 15.0,
                  lineHeight: 5,
                  percent: 50 / 100,
                  animation: true,
                  animationDuration: 2000,
                  progressColor: Colors.blueGrey,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10.0, left: 5.0),
                child: Text(
                  "150/300",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
              )
            ],
          ),
          const Divider(
            height: 15,
            thickness: 2
          ),
          Flexible(
            child: Container(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0),
                children: [
                  Image.network(
                      "https://cdn.pixabay.com/photo/2017/09/08/18/20/garbage-2729608__480.jpg",
                      fit: BoxFit.cover),
                  Image.network(
                      "https://3o232s43vzfttoe202fuvbc1-wpengine.netdna-ssl.com/wp-content/uploads/2021/07/25700200_web1_210702-SNE-MtDougGarbage-garbage_1.jpg",
                      fit: BoxFit.cover),
                  Image.network(
                      "https://static.toiimg.com/thumb/msid-67607685,imgsize-895627,width-400,resizemode-4/67607685.jpg",
                      fit: BoxFit.cover),
                  Image.network(
                      "https://static.toiimg.com/thumb/msid-81518032,width-1200,height-900,resizemode-4/.jpg",
                      fit: BoxFit.cover),
                  Image.network(
                      "https://telanganatoday.com/wp-content/uploads/2021/03/garbage.jpg",
                      fit: BoxFit.cover),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
