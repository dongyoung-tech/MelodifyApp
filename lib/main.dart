import 'package:flutter/material.dart';
import 'package:melodify/screen/main_screen.dart';
import 'package:melodify/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melodify',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => SplashScrren(),
        '/main' : (context) => MainScreen()
       }
    );
  }
}

