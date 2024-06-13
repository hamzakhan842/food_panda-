import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/login.dart';

class logout extends StatelessWidget {
  const logout({super.key});

  Future<void> _signout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {
      print('Error signing out:$e');
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('logout Failed'),
                content: Text(e.toString()),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text('Okay'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/food.jpg'), fit: BoxFit.cover)
          // gradient: LinearGradient(colors: [
          //   Color.fromARGB(255, 105, 79, 201),
          //   Color.fromARGB(255, 212, 176, 235),
          //   Color(0xffdbd5e0),
          // ], begin: FractionalOffset(1.0, .02), end: FractionalOffset(1, 0.8)),
          ),
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(top: 600),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _signout(context);
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(275, 50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
