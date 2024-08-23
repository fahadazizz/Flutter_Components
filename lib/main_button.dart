// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  VoidCallback onPress;
  String? data;
  MainButton({required this.data, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.08,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPress,
          child: Text('$data')),
    );
  }
}
