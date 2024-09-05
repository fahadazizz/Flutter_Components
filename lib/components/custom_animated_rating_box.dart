import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_components/components/custom_animated_snackbar.dart';

class CustomAnimatedRatingBox extends StatefulWidget {
  final int starCount;
  final double rating;
  final Function(double) onRatingChanged;
  String? text;
  VoidCallback? onPress;
  VoidCallback? submit;

  CustomAnimatedRatingBox({
    this.starCount = 5,
    this.rating = 0.0,
    required this.onRatingChanged,
    required this.text,
    required this.onPress,
    required this.submit,
  });

  @override
  State<CustomAnimatedRatingBox> createState() =>
      _CustomAnimatedRatingBoxState();
}

class _CustomAnimatedRatingBoxState extends State<CustomAnimatedRatingBox> {
  late double _rating;
  String emoji = '😊';

  @override
  void initState() {
    super.initState();
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
            height: 220,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white12,
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
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _space(10),
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
                          size: 40,
                        ),
                      );
                    }),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        widget.submit!();
                      },
                      child: const Text('Submit')),
                  _space(8),
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
              duration: const Duration(milliseconds: 300),
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
            submit: () {
              overlayEntry!.remove();
              CustomAnimatedSnackbar.successSnackbar(
                context,
                title: 'Rating given',
                subTitle: 'Thanks for rating our app',
              );
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Rating box is Loading...',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  AnimatedRatingBox.ratingBox(context);
                },
                child: Text('Rating Box'))
          ],
        ),
      ),
    );
  }
}
