import 'dart:async';

import 'package:covid_19_tracker/world_stats.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late  final AnimationController _controller =AnimationController(
      duration: Duration(seconds: 3), vsync: this)..repeat();

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3),
            ()=> Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context)=> WorldStats(),)));

  }

  @override
  void dispose() {

    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(animation: _controller,
          child: Image(image: AssetImage('images/virus.png')),
            builder: (BuildContext context, Widget? child){
            return Transform.rotate(angle: _controller.value* 2* 3.141 ,
            child: child,);
            },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height* .08,
        ),
        Text('COVID-19 Tracker', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
          decoration: TextDecoration.none

        ),),
        SizedBox(
          height: MediaQuery.of(context).size.height*.1,
        ),
        Text(' \u00a9 Wasiq Rai',style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          decoration: TextDecoration.none
        ),

        textAlign: TextAlign.end,)

      ],
    );
  }
}
