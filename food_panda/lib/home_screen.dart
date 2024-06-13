import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_panda/Apis/decode_location.dart';
import 'package:food_panda/Apis/firebase_services.dart';
import 'package:food_panda/hot_deals.dart';
import 'package:food_panda/order.dart';
import 'package:food_panda/screens/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'navbar.dart';
import 'cuisine.dart';
import 'package:geocoding/geocoding.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseServices.gettingFirebaseTokens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebars(),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        // leading: Container(child: Icon(Icons.table_rows_rounded)),
        title: Column(
          children: [
            const Text(
              'Food Cusine',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MapPage();
                    },
                  ));
                },
                child: Text(
                  FirebaseServices.currentP.toString(),
                  style: TextStyle(fontSize: 12),
                ))
          ],
        ),
        centerTitle: true,
        actions: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_active),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/previews/007/043/161/original/male-avatar-smiling-portrait-of-a-cheerful-young-man-with-a-happy-smile-vector.jpg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 40,
                  color: Colors.blueGrey[50],
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      hintText: 'Search Dishes',
                    ),
                  ),
                ),
                Container(
                    height: 40,
                    width: 40,
                    color: Colors.orange,
                    margin: EdgeInsets.only(left: 3),
                    child: Center(
                        child: Icon(
                      Icons.mic,
                      color: Colors.white,
                    ))),
              ],
            ), // Search bar end
            // SizedBox(height: 5,),
            // banner start
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: 345,
                      height: 135,
                      // color: Colors.blueGrey[50],
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/185001061/original/575d273286db5d27c139f5657781b002d99ddd09/design-pizza-banner-burger-flyer-food-flyer.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: 345,
                      height: 135,
                      // color: Colors.blueGrey[50],
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://t3.ftcdn.net/jpg/02/94/30/58/360_F_294305868_QTSSjWvyGvUCPfuH7bPuq6tBqF08hT0x.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), // banner end
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 5,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cuisine Crafted with Care",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "Show All",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CuisineFood();
                                },
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_circle_right,
                            color: Colors.orange,
                          )))
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                          return AddtoCart(
                                              'assets/images/p3.png',
                                              "Cheese\nSandwich");
                                        }),
                                      );
                                      ;
                                    },
                                    child: Image.asset(
                                      'assets/images/p3.png',
                                      fit: BoxFit.contain,
                                    )),
                                width: 80,
                                height: 70,
                              ),
                              Text(
                                "Cheese\nSandwich",
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              )
                            ],
                          ), //Sandwich
                          Column(
                            children: [
                              Container(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                          return AddtoCart(
                                              'assets/images/p2.png',
                                              "Spicy\nBurger");
                                        }),
                                      );
                                      ;
                                    },
                                    child: Image.asset(
                                      'assets/images/p2.png',
                                      fit: BoxFit.contain,
                                    )),
                                width: 80,
                                height: 70,
                              ),
                              Text(
                                "Spicy\nBurger",
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              )
                            ],
                          ), //Burger
                          Column(
                            children: [
                              Container(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                          return AddtoCart(
                                              'assets/images/p4.png',
                                              "Delicious\nKabbab");
                                        }),
                                      );
                                      ;
                                    },
                                    child: Image.asset(
                                      'assets/images/p4.png',
                                      fit: BoxFit.contain,
                                    )),
                                width: 80,
                                height: 70,
                              ),
                              Text(
                                "Delicious\nKabbab",
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              )
                            ],
                          ), //Burger
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                          return AddtoCart(
                                              'assets/images/p6.png',
                                              "Spicy\nChicken");
                                        }),
                                      );
                                      ;
                                    },
                                    child: Image.asset(
                                      'assets/images/p6.png',
                                      fit: BoxFit.contain,
                                    )),
                                width: 80,
                                height: 70,
                              ),
                              Text(
                                "Spicy\nChicken",
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              )
                            ],
                          ), //Sandwich
                          Column(
                            children: [
                              Container(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                          return AddtoCart(
                                              'assets/images/p7.png',
                                              "Healthy\nFish");
                                        }),
                                      );
                                      ;
                                    },
                                    child: Image.asset(
                                      'assets/images/p7.png',
                                      fit: BoxFit.contain,
                                    )),
                                width: 80,
                                height: 70,
                              ),
                              Text(
                                "Healthy\nFish",
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              )
                            ],
                          ), //Burger
                          Column(
                            children: [
                              Container(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                          return AddtoCart(
                                              'assets/images/p9.png',
                                              "Malai\nTikka");
                                        }),
                                      );
                                      ;
                                    },
                                    child: Image.asset(
                                      'assets/images/p9.png',
                                      fit: BoxFit.contain,
                                    )),
                                width: 80,
                                height: 70,
                              ),
                              Text(
                                "Malai\nTikka",
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              )
                            ],
                          ), //Burger
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 5,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Hot Deals",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Hot_deals()));
                    },
                    child: Text(
                      "Show All",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_circle_right,
                    color: Colors.orange,
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            deals_widget(
                              img:
                                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/pizza-poster-design-template-ce13bac229242394457bd8fd5555421f_screen.jpg?ts=1636995233',
                            ),
                            deals_widget(
                              img:
                                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/burger-poster-design-template-a5c5a9c028f773114d4dcc775c08ab85_screen.jpg?ts=1637040494',
                            ),
                            deals_widget(
                              img:
                                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/pizza-poster-design-template-ce13bac229242394457bd8fd5555421f_screen.jpg?ts=1636995233',
                            ),
                            deals_widget(
                              img:
                                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/burger-poster-design-template-a5c5a9c028f773114d4dcc775c08ab85_screen.jpg?ts=1637040494',
                            ), //Sandwich
                            // Column(children: [
                            //   Container(
                            //       width: 170,
                            //       height: 190,
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           image: DecorationImage(
                            //             image: NetworkImage(
                            //               'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/pizza-poster-design-template-ce13bac229242394457bd8fd5555421f_screen.jpg?ts=1636995233',
                            //             ),
                            //             fit: BoxFit.fill,
                            //           ))),
                            // ]), //Sandwich
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class deals_widget extends StatelessWidget {
  const deals_widget({
    super.key,
    required this.img,
  });
  final String img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Container(
            width: 170,
            height: 190,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(img
                      // 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/burger-poster-design-template-a5c5a9c028f773114d4dcc775c08ab85_screen.jpg?ts=1637040494',
                      ),
                  fit: BoxFit.fill,
                ))),
      ]),
    );
  }
}
