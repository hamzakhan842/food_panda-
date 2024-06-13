import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/Apis/firebase_services.dart';
import 'package:food_panda/Splash_screen.dart';
import 'package:food_panda/firebase_options.dart';
import 'package:food_panda/login_screen.dart';
import 'package:food_panda/order.dart';
import 'package:food_panda/screens/map_screen.dart';
// import 'custom_tabz.dart';
import 'tab_bar.dart';
import 'home_screen.dart';
import '.env';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = PublishAbleKey;
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash_Screen()));
}
