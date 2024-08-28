// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class CustomRotatedCard extends StatefulWidget {
  @override
  State<CustomRotatedCard> createState() => _CustomRotatedCardState();
}

class _CustomRotatedCardState extends State<CustomRotatedCard> {
  bool isUp = false;
  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery.of(context).size.height * 0.5;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.pink,
        ),
      ],
    );
  }
}
