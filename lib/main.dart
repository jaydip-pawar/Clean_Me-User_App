import 'package:clean_me/constants.dart';
import 'package:clean_me/providers/authentication_provider.dart';
import 'package:clean_me/providers/complaint_provider.dart';
import 'package:clean_me/providers/location_provider.dart';
import 'package:clean_me/screens/splash_screen.dart';
import 'package:clean_me/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ComplaintProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initializeFlutterFire() async {
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KudaCam',
      theme: theme(),
      home: const SplashScreen(),
      routes: routes,
      builder: EasyLoading.init(),
    );
  }
}
