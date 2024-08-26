import 'package:flutter/material.dart';

class CustomAnimatedCrouselScroll extends StatefulWidget {
  const CustomAnimatedCrouselScroll({super.key});

  @override
  State<CustomAnimatedCrouselScroll> createState() =>
      _CustomAnimatedCrouselScrollState();
}

class _CustomAnimatedCrouselScrollState
    extends State<CustomAnimatedCrouselScroll> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Carousel Scroll'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _containeredImage(0, 'assets/mountain.jpg'),
              _containeredImage(1, 'assets/mountain1.jpg'),
              _containeredImage(2, 'assets/mountain2.jpg'),
              _containeredImage(3, 'assets/mountain3.jpg'),
              _containeredImage(4, 'assets/mountain4.jpg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _containeredImage(int thisIndex, String image) {
    bool isSelected = _currentIndex == thisIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = thisIndex;
        });
      },
      child: AnimatedOpacity(
        opacity: _currentIndex == thisIndex ? 1 : 0.5,
        duration: Duration(milliseconds: 600),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          width: isSelected ? 180 : 30,
          height: 200,
          margin: const EdgeInsets.all(3.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white10,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
