import 'package:animated_carousel_scroller/animated_carousel_scroller.dart';
import 'package:flutter/material.dart';

class FirstAnimatedCarouselScroll extends StatelessWidget {
  const FirstAnimatedCarouselScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedCarouselScroller(
            images: const [
              'assets/mountain.jpg',
              'assets/mountain1.jpg',
              'assets/mountain2.jpg',
              'assets/mountain3.jpg',
              'assets/mountain4.jpg',
            ],
            initialIndex: 2,
            duration: Duration(milliseconds: 600),
            height: 200,
            currentCrouselWidth: 180,
            otherCrouselWidth: 28),
      ),
    );
  }
}
