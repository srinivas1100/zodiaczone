import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key,@required this.height,@required this.width,@required this.radius,@required this.child, this.color = Colors.white, this.shadeColor = Colors.black26, this.gradient}) : super(key: key);
  final dynamic height, width, radius;
  final Widget child;
  final Color color;
  final Color shadeColor;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: shadeColor,
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          )
        ],
        color: color,
        borderRadius: BorderRadius.circular(radius)
      ),
    );
  }
}
