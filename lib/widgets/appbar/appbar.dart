import 'package:flutter/material.dart';
import 'package:zodiaczone/widgets/appbar/customappbar.dart';

class AppBarWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomAppBar(),
      child: Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text('Zodiac Zone', style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold)),
    ),
    Row(
      children: [
        Container(
          child: Row(
            children:[
              Icon(Icons.wallet_travel_outlined,color: Colors.white,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("300", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              )
            ]
          ),
        ),
         IconButton(icon: Icon(Icons.notifications,color: Colors.white,), onPressed: () {})
      ],
    ),
         
        ]
      ),
       // color: Colors.black26,
      ),
    );
  }
}
