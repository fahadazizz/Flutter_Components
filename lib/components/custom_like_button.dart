import 'package:animated_react_button/animated_react_button.dart';
import 'package:flutter/material.dart';

class CustomLikeButton extends StatefulWidget {
  const CustomLikeButton({super.key});

  @override
  State<CustomLikeButton> createState() => _CustomLikeButtonState();
}

class _CustomLikeButtonState extends State<CustomLikeButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedReactButton(
              defaultColor: Colors.grey,
              reactColor: Colors.red,
              iconSize: 45,
              onPressed: () async {
                await Future.delayed(Duration(seconds: 1));
              })),
    );
  }
}
