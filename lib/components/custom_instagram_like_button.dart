import 'package:flutter/material.dart';

class ShowLike extends StatefulWidget {
  const ShowLike({super.key});

  @override
  State<ShowLike> createState() => _ShowLikeState();
}

class _ShowLikeState extends State<ShowLike> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _likeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _likeAnimation = Tween<double>(begin: 24, end: 100).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
      ),
    );

    // Start the animation immediately
    _animationController.forward().whenComplete(() {
      _animationController.reverse();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: AnimatedBuilder(
          animation: _likeAnimation,
          builder: (context, child) {
            return Icon(
              Icons.favorite,
              size: _likeAnimation.value,
              color: Colors.redAccent,
            );
          },
        ),
      ),
    );
  }
}

class LikeButton {
  static OverlayEntry? overlayEntry;

  static void showLike(BuildContext context) {
    final overlay = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (context) {
        return ShowLike();
      },
    );
    overlay.insert(overlayEntry!);
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry?.remove();
    });
  }
}

class CustomInstagramLikeButton extends StatelessWidget {
  const CustomInstagramLikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () {
          LikeButton.showLike(context);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white10,
          child: Center(
            child: IconButton(
              onPressed: () {
                LikeButton.showLike(context);
              },
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
        ),
      ),
    );
  }
}
