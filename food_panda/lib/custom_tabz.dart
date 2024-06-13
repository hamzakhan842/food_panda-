import 'package:flutter/material.dart';


class cTabz extends StatefulWidget {
  const cTabz({super.key});

  @override
  State<cTabz> createState() => _cTabzState();
}

class _cTabzState extends State<cTabz> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length: 3, vsync: this);
    return  Scaffold(
      body: Column(

          children: [
            Text('Custm Tabs'),
            SizedBox(height: 20,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.blueGrey,

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: TabBar(
                  indicator: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.red),
                  controller: tabController,
                  isScrollable: true,
                  tabs: [
                  Text('call'),
                  Text('call'),
                  Text('call'),
                ],)))



          ],
      ),
    );
  }
}
