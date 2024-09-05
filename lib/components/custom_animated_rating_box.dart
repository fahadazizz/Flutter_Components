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

class _CustomAnimatedRatingBoxState extends State<CustomAnimatedRatingBox>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _starAnimation;
  late Animation<double> _scaleAnimation;

  late double _rating;
  String emoji = '😊';

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _starAnimation = Tween<double>(begin: 40, end: 41).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.bounceOut),
    );
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _rating = widget.rating;
  }

  void _handleTap(int index) {
    setState(() {
      _rating = index.toDouble() + 1;
      switch (_rating) {
        case 1:
          [
            emoji = '😐',
          ];
        case 2:
          [
            emoji = '🙁',
          ];
        case 3:
          [
            emoji = '🙂',
          ];
        case 4:
          [
            emoji = '😀',
          ];
        case 5:
          [
            emoji = '😄',
          ];
      }

      _animationController
          .forward()
          .whenComplete(() => _animationController.reverse());
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
            height: 180,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white12,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _space(30),
                  SizedBox(
                    width: 280,
                    child: Text(
                      "${widget.text}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _space(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.starCount, (index) {
                      return AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return GestureDetector(
                            onTap: () => _handleTap(index),
                            child: Icon(
                              index < _rating.floor()
                                  ? Icons.star_rounded
                                  : Icons.star_border_purple500_rounded,
                              color: Colors.white,
                              size: _starAnimation.value,
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  GestureDetector(
                    onTap: widget.onPress,
                    child: const Text(
                      'Maybe Next time',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 10,
                      ),
                    ),
                  )
                ]),
          ),
          Positioned(
            top: -30,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                emoji,
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
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
