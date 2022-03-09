import 'dart:async';
import 'package:clean_me/models/navigate_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';

  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  timer() {
    Timer(const Duration(seconds: 5),()=> Navigator.pushReplacementNamed(context, NavigatePage.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/10150.jpg',width: MediaQuery.of(context).size.width*.5,),
                Center(
                  child: Container(
                      child: const Text(
                        "CLEAN-ME "

                        ,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                      )
                  ),
                ),
              ]
          )

      ),

    );

  }
}