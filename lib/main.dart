import 'package:covid_19_tracker/world_stats.dart';
import 'package:flutter/material.dart';
import 'SplashScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),


    );
  }
}

