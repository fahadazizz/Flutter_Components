import 'dart:async';

import 'package:flutter/material.dart';

class CustomShimmerEffect extends StatefulWidget {
  const CustomShimmerEffect({super.key});

  @override
  State<CustomShimmerEffect> createState() => _CustomShimmerEffectState();
}

class _CustomShimmerEffectState extends State<CustomShimmerEffect>
    with SingleTickerProviderStateMixin {
  Color mainColor = Colors.white60;
  List<Color> colors = [
    Colors.white60,
    // Colors.white38,
    Colors.white24,
  ];
  int _colorIndex = 0;
  Timer? timer;

  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _colorAnimation = ColorTween(
      begin: colors[0],
      end: colors[1],
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    timer = Timer.periodic(Duration(milliseconds: 800), (Timer timer) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % colors.length;
        _colorAnimation = ColorTween(
          begin: _colorAnimation.value,
          end: colors[_colorIndex],
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
        _animationController.forward(from: 0.0);
      });
    });

    _animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              _container(
                330,
                350,
                mainColor,
              ),
              ListTile(
                leading: _container(60, 60, _colorAnimation.value ?? mainColor),
                title: _container(60, 20, _colorAnimation.value ?? mainColor),
                trailing:
                    _container(30, 30, _colorAnimation.value ?? mainColor),
                subtitle:
                    _container(60, 10, _colorAnimation.value ?? mainColor),
              ),
              Positioned(
                  top: 80,
                  left: 20,
                  child:
                      _container(300, 260, _colorAnimation.value ?? mainColor)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _container(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
