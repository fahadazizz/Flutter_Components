// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatefulWidget {
  double progressValue;
  CustomCircularProgressIndicator({required this.progressValue});
  @override
  State<CustomCircularProgressIndicator> createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;

  bool isClicked = false;

  List<Color> _colors = [
    Colors.green,
    Colors.amber,
    Colors.blue,
    Colors.red,
  ];
  int _colorIndex = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(begin: 0.0, end: widget.progressValue).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _colorAnimation = ColorTween(begin: _colors[0], end: _colors[3]).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
          ..addListener(() {
            setState(() {});
          }));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        value: _animation.value,
                        backgroundColor: Colors.white10,
                        strokeWidth: 12,
                        valueColor: _colorAnimation,
                      ),
                    ),
                    Text(
                      '${(_animation.value * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                    ),
                  ],
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isClicked = !isClicked;
            if (isClicked) {
              Timer(Duration(milliseconds: 800), () {
                _colorIndex = (_colorIndex + 1) % _colors.length;
                _colorAnimation = ColorTween(
                  begin: _colorAnimation.value,
                  end: _colors[_colorIndex],
                ).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeInOut,
                  ),
                );
                _animationController.forward();
              });
            } else {
              Timer(Duration(milliseconds: 800), () {
                _colorIndex = (_colorIndex + 1) % _colors.length;
                _colorAnimation = ColorTween(
                  begin: _colorAnimation.value,
                  end: _colors[_colorIndex],
                ).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeInOut,
                  ),
                );
                _animationController.reverse();
              });
            }
          });
        },
        child: Icon(Icons.ads_click),
      ),
    );
  }
}
