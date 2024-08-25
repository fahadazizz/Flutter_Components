// ignore_for_file: must_be_immutable

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
  bool isClicked = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _animation = Tween<double>(begin: 0.0, end: widget.progressValue).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
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
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
          });
        },
        child: Icon(Icons.ads_click),
      ),
    );
  }
}
