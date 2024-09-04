import 'dart:async';

import 'package:flutter/material.dart';

class CustomAnimatedRatingBox extends StatefulWidget {
  final int starCount;
  final double rating;
  final Function(double) onRatingChanged;
  String? text;
  VoidCallback? onPress;

  CustomAnimatedRatingBox({
    this.starCount = 5,
    this.rating = 0.0,
    required this.onRatingChanged,
    required this.text,
    required this.onPress,
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
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 32,
            height: 200,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black38,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _space(25),
                  SizedBox(
                    width: 280,
                    child: Text(
                      "${widget.text}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _space(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.starCount, (index) {
                      return GestureDetector(
                        onTap: () => _handleTap(index),
                        child: Icon(
                          index < _rating.floor()
                              ? Icons.star_rounded
                              : Icons.star_border_purple500_rounded,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      );
                    }),
                  ),
                  GestureDetector(
                    onTap: widget.onPress,
                    child: const Text(
                      'Maybe Next time',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  )
                ]),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _space(double height) {
    return SizedBox(
      height: height,
    );
  }
}

// applying concept of overlay in this
class AnimatedRatingBox {
  static void ratingBox(BuildContext context) {
    final overlay = Overlay.of(
      context,
    );
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        double newRating = 0;
        return Align(
          alignment: Alignment.center,
          child: CustomAnimatedRatingBox(
            onRatingChanged: (rating) {
              rating = newRating;
            },
            onPress: () {
              overlayEntry!.remove();
            },
            text: 'Give some Rating to developer',
          ),
        );
      },
    );

    overlay.insert(overlayEntry);
  }
}

// rating box use
class RatingBox extends StatefulWidget {
  const RatingBox({super.key});

  @override
  State<RatingBox> createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      AnimatedRatingBox.ratingBox(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Rating box is Loading...',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
