import 'package:flutter/material.dart';
import 'package:food_panda/home_screen.dart';
import 'package:food_panda/hot_deals.dart';
import 'package:food_panda/login.dart';
import 'package:food_panda/logout.dart';

class Sidebars extends StatelessWidget {
  const Sidebars({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Hamza Khan '),
              accountEmail: Text("hamzakhan11@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/previews/007/043/161/original/male-avatar-smiling-portrait-of-a-cheerful-young-man-with-a-happy-smile-vector.jpg',
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    icon: Icon(Icons.home)),
                Text("Home"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Icon(Icons.accessibility_new_rounded),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Hot_deals()));
                    },
                    icon: Icon(Icons.date_range_outlined)),
                Text("Deas"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Icon(Icons.accessibility_new_rounded),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => logout()));
                    },
                    icon: Icon(Icons.logout)),
                Text("Logout"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
