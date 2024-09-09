import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CustomAnimatedImageShileShow extends StatelessWidget {
  List<Image> images = [
    Image.asset('assets/mountain.jpg', fit: BoxFit.cover),
    Image.asset('assets/mountain1.jpg', fit: BoxFit.cover),
    Image.asset(
      'assets/mountain2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/mountain3.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/mountain4.jpg',
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ImageSlideshow(
          width: 300,
          height: 200,
          autoPlayInterval: 3000,
          indicatorColor: Colors.amber,
          children: List.generate(
            4,
            (index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: images[index]);
            },
          ),
        ),
      ),
    );
  }
}
