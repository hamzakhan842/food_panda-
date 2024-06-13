import 'package:flutter/material.dart';
class CuisineFood extends StatelessWidget {
  const CuisineFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(child: InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.arrow_back_rounded),),),
        title: Text('Cuisine Crafted with Care'),
        backgroundColor: Colors.orange,
      ),
      body: Column(

        children: [
          Padding(padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        Container(width: 80,height: 70,
                            child: Image.asset('assets/images/p3.png',fit: BoxFit.contain,)),
                        Text("Cheese\nSandwich",textAlign: TextAlign.center,style: TextStyle(),)],
                    ),//Sandwich
                    Column(
                      children: [
                        Container(width: 80,height: 70,
                            child: Image.asset('assets/images/p2.png',fit: BoxFit.contain,)),
                        Text("Spicy\nBurger",textAlign: TextAlign.center,style: TextStyle(),)],
                    ),//Burger
                    Column(
                      children: [
                        Container(width: 80,height: 70,
                            child: Image.asset('assets/images/p4.png',fit: BoxFit.contain,)),
                        Text("Delicious\nKabbab",textAlign: TextAlign.center,style: TextStyle(),)],
                    ),//Burger


                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        Container(width: 80,height: 70,
                            child: Image.asset('assets/images/p5.png',fit: BoxFit.contain,)),
                        Text("Spicy\nChicken",textAlign: TextAlign.center,style: TextStyle(),)],
                    ),//Sandwich
                    Column(
                      children: [
                        Container(width: 80,height: 70,
                            child: Image.asset('assets/images/p6.png',fit: BoxFit.contain,)),
                        Text("Healthy\nFish",textAlign: TextAlign.center,style: TextStyle(),)],
                    ),//Burger
                    Column(
                      children: [
                        Container(width: 80,height: 70,
                            child: Image.asset('assets/images/p7.png',fit: BoxFit.contain,)),
                        Text("Delicious\nKabbab",textAlign: TextAlign.center,style: TextStyle(),)],
                    ),//Burger


                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        Container(width: 80,height: 70,
                            child: Image.asset('assets/images/p8.png',fit: BoxFit.contain,)),
                        Text("Barbecue\nSirloin",textAlign: TextAlign.center,style: TextStyle(),)],
                    ),//Sandwich
                    Column(
                      children: [
                        Container(width: 80,height: 70,
                            child: Image.asset('assets/images/p9.png',fit: BoxFit.contain,)),
                        Text("Grilled\nMeat",textAlign: TextAlign.center,style: TextStyle(),)],
                    ),//Burger
                    Column(
                      children: [
                        Container(width: 80,height: 70,
                            child: Image.asset('assets/images/p10.png',fit: BoxFit.contain,)),
                        Text("Crispy\nFried Chicken",textAlign: TextAlign.center,style: TextStyle(),)],
                    ),//Burger


                  ],
                ),


              ],
            ),

          ),

        ],
      ),
    );
  }
}
