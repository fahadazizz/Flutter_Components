import 'package:flutter/material.dart';

class CustomAnimatedRatingBox extends StatefulWidget {
  final int starCount;
  final double rating;
  final Function(double) onRatingChanged;

  CustomAnimatedRatingBox({
    this.starCount = 5,
    this.rating = 0.0,
    required this.onRatingChanged,
  });

  @override
  State<CustomAnimatedRatingBox> createState() =>
      _CustomAnimatedRatingBoxState();
}

class _CustomAnimatedRatingBoxState extends State<CustomAnimatedRatingBox> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  void _handleTap(int index) {
    setState(() {
      _rating = index.toDouble() + 1;
    });
    widget.onRatingChanged(_rating);
  }

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
              children: List.generate(widget.starCount, (index) {
                return GestureDetector(
                  onTap: () => _handleTap(index),
                  child: Icon(
                    index < _rating.floor()
                        ? Icons.star
                        : index < _rating
                            ? Icons.star_half
                            : Icons.star_border,
                    color: Colors.white,
                    size: 40.0,
                  ),
                );
              }),
            ),
            Container(),
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
