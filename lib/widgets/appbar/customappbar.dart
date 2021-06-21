import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomAppBar extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint_0.shader = ui.Gradient.linear(Offset(size.width*0.50,0),Offset(size.width,size.height),[Color(0xffc957ba),Color(0xffb34444),],[0.00,1.00]); 
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.0004000,size.height*0.0008000);
    path_0.quadraticBezierTo(size.width*0.0007000,size.height*0.8001000,size.width*0.1000000,size.height*0.8020000);
    path_0.quadraticBezierTo(size.width*0.7000000,size.height*0.8005000,size.width*0.9000000,size.height*0.8000000);
    path_0.quadraticBezierTo(size.width*0.9986000,size.height*0.8052000,size.width,size.height);
    path_0.lineTo(size.width,0);
    path_0.quadraticBezierTo(size.width*0.7501000,size.height*0.0002000,size.width*0.0004000,size.height*0.0008000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
