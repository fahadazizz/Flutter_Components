import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAnimatedSlideButton extends StatefulWidget {
  final VoidCallback onPress;
  String? beforeSlideText;
  double? width;
  double height;
  Color? beforeSlideColor;
  Color? afterSlideColor;
  Color afterSliderBackColor;

  CustomAnimatedSlideButton({
    required this.width,
    required this.height,
    required this.beforeSlideText,
    required this.beforeSlideColor,
    required this.afterSlideColor,
    required this.afterSliderBackColor,
    required this.onPress,
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
  late Animation<double> _widthAnimation;

  double _startDrag = 0;
  double _dragOffset = 0;
  bool _seeSlider = true;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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
            begin:
                Color.lerp(widget.beforeSlideColor, widget.afterSlideColor, 0),
            end: Color.lerp(
                widget.beforeSlideColor, widget.afterSlideColor, 0.9))
        .animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _textOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _widthAnimation =
        Tween<double>(begin: widget.width, end: widget.height).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
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
                  width: _widthAnimation.value,
                  height: widget.height,
                  decoration: BoxDecoration(
                    color: _colorAnimation.value,
                    borderRadius: _seeSlider
                        ? BorderRadius.circular(22)
                        : BorderRadius.circular(100),
                  ),
                  alignment: Alignment.center,
                  child: _isDragging
                      ? const Icon(Icons.done)
                      : FadeTransition(
                          opacity: _textOpacityAnimation,
                          child: Text(
                              widget.beforeSlideText ?? 'Slide to Continue')),
                );
              },
            ),
            Visibility(
              visible: _seeSlider,
              child: GestureDetector(
                onHorizontalDragStart: (details) {
                  _startDrag = details.localPosition.dx;
                },
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    double _dragPercentage =
                        _dragOffset / (widget.width! * 0.76);
                    _dragOffset = (details.localPosition.dx - _startDrag).clamp(
                        0.0,
                        widget.width! * 0.76); // Adjust max value as needed

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
                    double _dragPercentage =
                        _dragOffset / (widget.width! * 0.76);
                    if (_dragPercentage > 0.99) {
                      _animationController.forward();
                      _isDragging = true;
                      _seeSlider = false;
                      onPressCheck();
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
                    width: widget.height,
                    height: widget.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: widget.afterSliderBackColor,
                        boxShadow: [
                          BoxShadow(
                            color: widget.afterSliderBackColor,
                            blurRadius: 10,
                          )
                        ]),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: widget.height * 0.5,
                    ),
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

// using this button
class CheckAnimatedSlideButton extends StatelessWidget {
  const CheckAnimatedSlideButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomAnimatedSlideButton(
          width: 240,
          height: 60,
          beforeSlideText: 'Slide to Continue',
          beforeSlideColor: Colors.white10,
          afterSlideColor: Colors.amber,
          afterSliderBackColor: Colors.amber,
          onPress: () {},
        ),
      ),
    );
  }
}
