// import 'package:flutter/material.dart';

// class Hot_deals extends StatelessWidget {
//   const Hot_deals({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//       backgroundColor: Colors.orange,
//       title: Text('Hot _ Deals'),
//     ),body: ,);
//   }
// }

import 'package:flutter/material.dart';

class Hot_deals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Hot Deals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 20, // Number of items
          itemBuilder: (context, index) {
            return Container(
                width: 170,
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/burger-poster-design-template-a5c5a9c028f773114d4dcc775c08ab85_screen.jpg?ts=1637040494',
                      ),
                      fit: BoxFit.fill,
                    )));
          },
        ),
      ),
    );
  }
}
