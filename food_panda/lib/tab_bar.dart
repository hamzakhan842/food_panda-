import 'package:flutter/material.dart';
import 'home_screen.dart';
class Tabz extends StatefulWidget {
  const Tabz({super.key});

  @override
  State<Tabz> createState() => _TabzState();
}

class _TabzState extends State<Tabz> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: AppBar(title: Text('Panda Tabzz'),
            centerTitle: true,
            backgroundColor: Colors.orange,
            bottom: const TabBar(
                isScrollable: true,
                indicatorColor: Colors.black87,
                // labelPadding: EdgeInsets.symmetric(vertical: 50,horizontal: 5),
                tabs: [
                  // Tab(child: Icon(Icons.camera_alt)),

                  // Tab(child: Home()),
                  Tab(child: Text('Chats')),
                  Tab(child: Text('Status')),
                  Tab(child: Text('Calls')),
                ]),
          ),
          body: TabBarView(children: [
            Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(Icons.camera_alt,color: Colors.green,size: 30,),
                Text("Grant camera Permission", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],),
           Column( mainAxisAlignment: MainAxisAlignment.center,
             children: [Icon(Icons.chat,color: Colors.green,size: 30,),
           Text("There is no messages yet!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           ],),
           Column( mainAxisAlignment: MainAxisAlignment.center,
             children: [Icon(Icons.view_column_rounded,color: Colors.green,size: 30,),
           Text("There is no Status yet!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           ],),
           Column( mainAxisAlignment: MainAxisAlignment.center,
             children: [Icon(Icons.call,color: Colors.green,size: 30,),
           Text("There is no Calls yet!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           ],),
          ],),
        ),);
  }
}
