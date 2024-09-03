import 'package:flutter/material.dart';

class CustomAnimatedRatingBox extends StatefulWidget {
  const CustomAnimatedRatingBox({super.key});

  @override
  State<CustomAnimatedRatingBox> createState() =>
      _CustomAnimatedRatingBoxState();
}

class _CustomAnimatedRatingBoxState extends State<CustomAnimatedRatingBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 32,
          padding: const EdgeInsets.all(12),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white10,
          ),
          child: Column(children: [
            SizedBox(
              width: 280,
              child: Text(
                "How do you rate our Design developed by Fahad Aziz",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _starButton(0),
                _starButton(1),
                _starButton(2),
                _starButton(3),
                _starButton(4),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget _starButton(int thisIndex) {
    bool click = false;
    return IconButton(
      onPressed: () {
        if (thisIndex > 0) {
          setState(() {
            click = !click;
          });
        }
      },
      icon: click == true ? Icon(Icons.star_border_outlined) : Icon(Icons.star),
    );
  }
}

class AnimatedRatingBox {}

// rating box
class RatingBox extends StatelessWidget {
  const RatingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
