import 'package:flutter/material.dart';

class DateButton extends StatelessWidget {
  const DateButton(
      {Key key, @required this.day, @required this.date, @required this.press, this.gradient})
      : super(key: key);
  final String day, date;
  final Function press;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
            gradient: gradient,
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(day),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: Text(date),
          ),
        ]),
      ),
    );
  }
}
