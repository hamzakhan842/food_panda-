import 'package:flutter/material.dart';
import 'package:food_panda/provider/stripe.dart';

import 'home_screen.dart';

class MyCart extends StatefulWidget {
  const MyCart(
    this.picURL,
    this.itemName, {
    super.key,
    required this.itemPrice,
    required this.s,
    required this.m,
    required this.l,
    required this.sc,
    required this.mc,
    required this.lc,
  });
  final int s, m, l;
  final bool sc, mc, lc;

  final String picURL;
  final String itemName;
  final int itemPrice;

  get context => null;
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int a = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: Container(child: InkWell(onTap: Navigator.pop(context),child: Icon(Icons.arrow_back_rounded),),),
          title: const Text("My Cart"), centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    height: 40,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 18,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Delivery",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, letterSpacing: 1),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Delivery  =======================
                  Container(
                    width: 160,
                    height: 40,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 18,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Pickup",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, letterSpacing: 1),
                          )
                        ],
                      ),
                    ),
                  ),
                  // pickup Option =======================
                ],
              ),
              // Delivery Option =======================
            ),
            Container(
              color: Colors.blueGrey[50],
              width: double.infinity,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.shopping_bag),
                        Text(
                          "Food in your bag",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                        Text(
                          "Items",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                        Text(
                          "Amount",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.picURL),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                            child: Row(
                          children: [
                            const Icon(
                              Icons.accessibility_new_rounded,
                              color: Colors.green,
                            ),
                            Text(
                              widget.itemName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        )),
                        Column(children: [
                          Container(child:
                              LayoutBuilder(builder: (context, constraints) {
                            if (widget.sc == true) {
                              return Text('S: ${widget.s}');
                            } else {
                              return const Text('');
                            }
                          })),
                          Container(child:
                              LayoutBuilder(builder: (context, constraints) {
                            if (widget.mc == true) {
                              return Text('M:  ${widget.m}');
                            } else {
                              return const Text('');
                            }
                          })),
                          Container(child:
                              LayoutBuilder(builder: (context, constraints) {
                            if (widget.lc == true) {
                              return Text('L:  ${widget.l}');
                            } else {
                              return const Text('');
                            }
                          })),
                        ]),
                        Text(
                          "\$ ${widget.itemPrice.toString()}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 240,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tip Delivery Partner"),
                            Text(
                                "Helping your delivery Partner by Adding Tip."),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        color: Colors.orange,
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () async {
                            await PaymentController().makePayment(
                                amount: widget.itemPrice.toString(),
                                currency: 'USD',
                                context: context);
                          },
                          // showDialog<String>(
                          //   context: context,
                          //   builder: (BuildContext context) => AlertDialog(
                          //     title: const Text(
                          //       'Order Confirmed',
                          //       textAlign: TextAlign.center,
                          //     ),
                          //     content: const Row(
                          //       children: [
                          //         Text("Your order is on it's way  ",
                          //             textAlign: TextAlign.center),
                          //         Icon(
                          //           Icons.delivery_dining,
                          //           color: Colors.orange,
                          //         )
                          //       ],
                          //     ),
                          //     actions: <Widget>[
                          //       TextButton(
                          //         onPressed: () {},
                          //         child: const Text('OK'),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          child: const Text(
                            'Place Order',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
