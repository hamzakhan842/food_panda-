import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_panda/home_screen.dart';
import 'package:food_panda/login_screen.dart';
import 'package:food_panda/screens/map_screen.dart';
import 'package:food_panda/signin.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Sign_up()));
    });
    // _navigatetohome();
  }

  // _navigatetohome() async {
  //   await Future.delayed(Duration(milliseconds: 3000), () {});
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => Home()));
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'),
                fit: BoxFit.fill)),
        // child: Center(
        //     child: Text(
        //   'hello working ',
        //   style: TextStyle(fontSize: 36),
        // )),
      ),
    );
  }
}
