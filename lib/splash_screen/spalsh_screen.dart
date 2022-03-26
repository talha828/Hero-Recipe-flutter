import 'dart:async';
import 'package:flutter/material.dart';
import 'package:recipe_hero/splash_screen/indicator_screen/screen_indicator.dart';



class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>PageIndicator(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      body: Container(
        color: Color(0xffff0000),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                width: width * 0.5,
                height: height * 0.5,
                child: Image(image: AssetImage("assets/image/chief.png",))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                width: width * 0.5,
                height: height * 0.3,
                child: Image(image: AssetImage("assets/image/recipe_hero_splash.png")))
          ],
        ),
      ),
    ));
  }
}

