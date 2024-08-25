import 'package:flutter/material.dart';

class CustomLikeButton extends StatefulWidget {
  const CustomLikeButton({super.key});

  @override
  State<CustomLikeButton> createState() => _CustomLikeButtonState();
}

class _CustomLikeButtonState extends State<CustomLikeButton>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _boxAnimationX;
  late Animation<double> _boxAnimationY;
  bool showBoxes = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _sizeAnimation = Tween<double>(begin: 32, end: 40).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.bounceOut),
    );

    _boxAnimationX = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _boxAnimationY = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      showBoxes = true;
      if (isLiked) {
        _animationController.forward().whenComplete(() {
          setState(() {
            showBoxes = false;
          });
        });
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            GestureDetector(
              onTap: _toggleLike,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    size: _sizeAnimation.value,
                    color: isLiked ? Colors.pink : Colors.white,
                  );
                },
              ),
            ),
            if (showBoxes) ..._buildAnimatedBoxes(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAnimatedBoxes() {
    return [
      Positioned(
        left: 0 + _boxAnimationX.value,
        bottom: 0 + _boxAnimationY.value,
        child: _buildBox(Colors.blue),
      ),
      Positioned(
        right: 0 + _boxAnimationX.value,
        bottom: 0 + _boxAnimationY.value,
        child: _buildBox(Colors.green),
      ),
      Positioned(
        left: 0 + _boxAnimationX.value,
        top: 0 + _boxAnimationY.value,
        child: _buildBox(Colors.red),
      ),
      Positioned(
        right: 0 + _boxAnimationX.value,
        top: 0 + _boxAnimationY.value,
        child: _buildBox(Colors.orange),
      ),
    ];
  }

  Widget _buildBox(Color color) {
    return Container(
      width: 8,
      height: 4,
      color: color,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
