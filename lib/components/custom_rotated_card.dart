import 'package:flutter/material.dart';

class CustomRotatedCard extends StatefulWidget {
  @override
  State<CustomRotatedCard> createState() => _CustomRotatedCardState();
}

class _CustomRotatedCardState extends State<CustomRotatedCard> {
  double angle = 0.0;
  double thisAngle = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            angle = details.delta.dx;
          });
        },
        onPanEnd: (details) {
          setState(() {
            thisAngle = angle;
          });
        },
        child: Transform(
          transform: Matrix4.rotationX(thisAngle),
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            width: 200,
            height: 200,
            color: Colors.pink,
            child: Text('welcom'),
          ),
        ),
      ),
    ));
  }
}
