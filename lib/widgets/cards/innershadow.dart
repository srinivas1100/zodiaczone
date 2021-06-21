import 'package:flutter/material.dart';
import 'package:zodiaczone/widgets/cards/concave.dart';

class InnerShadow extends StatelessWidget {
   const InnerShadow({Key key,@required this.height,@required this.width,@required this.radius,@required this.child}) : super(key: key);
  final dynamic height, width, radius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: height,
      width: width,
      decoration: ConcaveDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius),),
        depth: 10,
        colors: [Colors.white, Colors.red[500]],
        opacity: 1.0,
      )
    );
  }
}