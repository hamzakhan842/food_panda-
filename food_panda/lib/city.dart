import 'package:flutter/material.dart';

class City extends StatelessWidget {
  const City({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('food_panda/assets/images/splash.jpg'),
                fit: BoxFit.fill)),
      ),
    );
  }
}
