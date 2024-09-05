import 'dart:ui';

import 'package:flutter/material.dart';

class CustomDesignedAnimatedOnboardScreen extends StatefulWidget {
  const CustomDesignedAnimatedOnboardScreen({super.key});

  @override
  State<CustomDesignedAnimatedOnboardScreen> createState() =>
      _CustomDesignedAnimatedOnboardScreenState();
}

class _CustomDesignedAnimatedOnboardScreenState
    extends State<CustomDesignedAnimatedOnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white12,
          ),
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5, // Adjusted height
              decoration: BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                  image: AssetImage('assets/travelerImage1.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center, // Centering the image
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.0059524, size.height * 0.0028571);
    path.quadraticBezierTo(size.width * -0.0059524, size.height * 0.4414286, 0,
        size.height * 0.5414286);
    path.cubicTo(
        size.width * 0.0401786,
        size.height * 0.5667857,
        size.width * 0.1078869,
        size.height * 0.5900000,
        size.width * 0.1488095,
        size.height * 0.5928571);
    path.cubicTo(
        size.width * 0.1971726,
        size.height * 0.5896429,
        size.width * 0.2611607,
        size.height * 0.5532143,
        size.width * 0.3184524,
        size.height * 0.5471429);
    path.cubicTo(
        size.width * 0.3742560,
        size.height * 0.5414286,
        size.width * 0.4345238,
        size.height * 0.6025000,
        size.width * 0.5148810,
        size.height * 0.6014286);
    path.cubicTo(
        size.width * 0.6026786,
        size.height * 0.5985714,
        size.width * 0.6279762,
        size.height * 0.5328571,
        size.width * 0.6964286,
        size.height * 0.5328571);
    path.cubicTo(
        size.width * 0.7552083,
        size.height * 0.5275000,
        size.width * 0.7790179,
        size.height * 0.5571429,
        size.width * 0.8125000,
        size.height * 0.5728571);
    path.quadraticBezierTo(size.width * 0.8668155, size.height * 0.5975000,
        size.width * 0.9434524, size.height * 0.5428571);
    path.lineTo(size.width * 0.9970238, size.height * 0.4871429);
    path.lineTo(size.width * 0.9940476, size.height * 0.0028571);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
