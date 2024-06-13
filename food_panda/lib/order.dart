import 'check_boxx.dart';
import 'package:flutter/material.dart';
import 'mycart.dart';
import 'home_screen.dart';

class AddtoCart extends StatefulWidget {
  const AddtoCart(this.picURL, this.itemName, {super.key});
  final String picURL;
  final String itemName;

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  int price = 0;
  int counter1 = 1;
  int counter2 = 1;
  int counter3 = 1;

  int small = 0;
  int medium = 0;
  int large = 0;

  void incre1() {
    setState(() {
      if (isChecked1 == true) {
        counter1++;

        price = price + 120;
        small = small + 120;

        print("Price = $price , small = $small");
      }
    });
  }

  void incre2() {
    setState(() {
      if (isChecked2 == true) {
        counter2++;

        price = price + 150;
        medium = medium + 150;

        print("Price = $price , medium = $medium");
      }
    });
  }

  void incre3() {
    setState(() {
      if (isChecked3 == true) {
        counter3++;

        price = price + 150;
        large = large + 150;

        print("Price = $price , large = $large");
      }
    });
  }

  void decre1() {
    setState(() {
      if (counter1 > 1 && isChecked1 == true) {
        counter1--;

        price = price - 120;
        small = small - 120;

        print("Price = $price , small = $small");
      }
    });
  }

  void decre2() {
    setState(() {
      if (counter2 > 1 && isChecked2 == true) {
        counter2--;
        price = price - 150;
        medium = medium - 150;

        print("Price = $price , medium = $medium");
      }
    });
  }

  void decre3() {
    setState(() {
      if (counter3 > 1 && isChecked3 == true) {
        counter3--;
        price = price - 180;
        large = large - 180;

        print("Price = $price , large = $large");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: Text('Add to cart'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.picURL),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.gif_box_rounded,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.itemName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Column(
                          children: [
                            Icon(
                              Icons.bookmarks_outlined,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Item image , name end here =====================
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                    width: 320,
                    child: Text(
                      'A burger is a patty of ground beef grilled and placed between'
                      ' two halves of a bun. Slices of raw onion, ',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ))
              ],
            ),
          ),
          // Item description end ====================
          Container(
            color: Colors.blueGrey[50],
            width: double.maxFinite,
            height: 310,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Varition',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // ================== Small variation Start    +++++++++++++++
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          'Small',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),

                      Container(
                        child: Row(
                          children: [
                            const Text('\$120',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.deepOrange)),
                            Checkbox(
                              value: isChecked1,
                              onChanged: (value) {
                                setState(() {
                                  isChecked1 = value!;
                                  if (isChecked1 == false) {
                                    counter1 = 1;
                                    // small = 120;
                                    price = price - small;
                                    small = 0;
                                    print("Price = $price , small = $small");
                                  } else {
                                    price = price + 120;
                                    small = small + 120;

                                    print("Price = $price , small = $small");
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange,
                        ),
                        width: 90,
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    decre1();
                                  },
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    size: 14,
                                  )),
                                ),
                              ),
                              Container(
                                  width: 25,
                                  height: 15,
                                  child: Center(
                                      child: Text(
                                    counter1.toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ))),
                              Container(
                                width: 15,
                                height: 15,
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    incre1();
                                  },
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 14,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

// ================== Medium variation start+++++++++++++++
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          'Medium',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),

                      Container(
                        child: Row(
                          children: [
                            const Text('\$150',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.deepOrange)),
                            Checkbox(
                              value: isChecked2,
                              onChanged: (value) {
                                setState(() {
                                  isChecked2 = value!;
                                  if (isChecked2 == false) {
                                    counter2 = 1;
                                    // small = 120;
                                    price = price - medium;
                                    medium = 0;
                                    print("Price = $price , medium = $medium");
                                  } else {
                                    price = price + 150;
                                    medium = medium + 150;

                                    print("Price = $price , medium = $medium");
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange,
                        ),
                        width: 90,
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    decre2();
                                  },
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    size: 14,
                                  )),
                                ),
                              ),
                              Container(
                                  width: 25,
                                  height: 15,
                                  child: Center(
                                      child: Text(
                                    counter2.toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ))),
                              Container(
                                width: 15,
                                height: 15,
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    incre2();
                                  },
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 14,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

// ================== large variation start+++++++++++++++
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          'Large',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            const Text('\$180',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.deepOrange)),
                            Checkbox(
                              value: isChecked3,
                              onChanged: (value) {
                                setState(() {
                                  isChecked3 = value!;
                                  if (isChecked3 == false) {
                                    counter3 = 1;
                                    // small = 120;
                                    price = price - large;
                                    large = 0;
                                    print("Price = $price , large = $large");
                                  } else {
                                    price = price + 180;
                                    large = large + 180;

                                    print("Price = $price , large = $large");
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange,
                        ),
                        width: 90,
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    decre3();
                                  },
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    size: 14,
                                  )),
                                ),
                              ),
                              Container(
                                  width: 25,
                                  height: 15,
                                  child: Center(
                                      child: Text(
                                    counter3.toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ))),
                              Container(
                                width: 15,
                                height: 15,
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    incre3();
                                  },
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 14,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Varitions end here =======
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                ),
                SizedBox(height: 10),
                Container(
                  child: InkWell(
                    onTap: () {
                      if (isChecked1 == true ||
                          isChecked2 == true ||
                          isChecked3 == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyCart(
                                  widget.picURL, widget.itemName,
                                  itemPrice: price,
                                  s: counter1,
                                  m: counter2,
                                  l: counter3,
                                  sc: isChecked1,
                                  mc: isChecked2,
                                  lc: isChecked3),
                            ));
                      }
                    },
                    child: Center(
                        child: Text(
                      'ADD TO CART',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueGrey,
                  ),
                  width: 200,
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
