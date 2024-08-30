import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAnimatedSlideButton extends StatefulWidget {
  final VoidCallback onPress;
  final String afterSlideText;
  final String? beforeSlideText;
  final Color sliderBackColor;
  final Color? sliderFrontColor;
  final Color? beforeSlideColor;
  final Color? afterSlideColor;
  final Color? beforeSlideTextColor;
  final Color? afterSlideTextColor;

  CustomAnimatedSlideButton({
    super.key,
    required this.onPress,
    required this.afterSlideText,
    required this.afterSlideTextColor,
    required this.afterSlideColor,
    required this.sliderBackColor,
    this.sliderFrontColor,
    this.beforeSlideText,
    this.beforeSlideTextColor,
    this.beforeSlideColor,
  });

  @override
  State<CustomAnimatedSlideButton> createState() =>
      _CustomAnimatedSlideButtonState();
}

class _CustomAnimatedSlideButtonState extends State<CustomAnimatedSlideButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _textOpacityAnimation;

  double width = 240;
  double _startDrag = 0;
  double _dragOffset = 0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _colorAnimation = ColorTween(
            begin: Color.lerp(
                widget.beforeSlideTextColor ?? Colors.white10, Colors.white, 0),
            end: Color.lerp(Colors.white10, widget.afterSlideTextColor, 0.9))
        .animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _textOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  width: width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _colorAnimation.value,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: _isDragging
                      ? Text(
                          '${widget.afterSlideText}',
                          style: TextStyle(
                            color: widget.afterSlideColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      : FadeTransition(
                          opacity: _textOpacityAnimation,
                          child: Text(
                              widget.beforeSlideText ?? 'Slide to Continue')),
                );
              },
            ),
            GestureDetector(
              onHorizontalDragStart: (details) {
                _startDrag = details.localPosition.dx;
              },
              onHorizontalDragUpdate: (details) {
                setState(() {
                  double _dragPercentage = _dragOffset / (width * 0.76);
                  _dragOffset = (details.localPosition.dx - _startDrag)
                      .clamp(0.0, width * 0.76); // Adjust max value as needed

                  if (_dragPercentage > 0.5) {
                    setState(() {
                      _textOpacityAnimation =
                          Tween<double>(begin: 1 - _dragPercentage, end: 0)
                              .animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.easeInOut));
                    });
                  }
                });
              },
              onHorizontalDragCancel: () {
                setState(() {
                  _dragOffset = 0;
                  _animationController.reverse();
                  _isDragging = false;
                });
              },
              onHorizontalDragEnd: (details) {
                setState(() {
                  double _dragPercentage = _dragOffset / (width * 0.76);

                  if (_dragPercentage > 0.99) {
                    _animationController.forward();
                    onPressCheck();
                    _isDragging = true;
                  } else {
                    _animationController.reverse().whenComplete(() {
                      _dragOffset = 0;
                      _isDragging = false;
                      _animationController.reverse();
                    });
                  }
                });
              },
              child: Transform.translate(
                offset: Offset(_dragOffset, 0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: widget.sliderBackColor,
                      boxShadow: [
                        BoxShadow(
                          color: widget.sliderBackColor,
                          blurRadius: 10,
                        )
                      ]),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressCheck() {
    widget.onPress();
  }
}
