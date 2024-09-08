import 'dart:async';

import 'package:flutter/material.dart';

class SecondAnimatedOverlayBottomNavbar extends StatefulWidget {
  const SecondAnimatedOverlayBottomNavbar({super.key});

  @override
  State<SecondAnimatedOverlayBottomNavbar> createState() =>
      _SecondAnimatedOverlayBottomNavbarState();
}

class _SecondAnimatedOverlayBottomNavbarState
    extends State<SecondAnimatedOverlayBottomNavbar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;
  late Animation<double> _opacityAnimation;

  int _currentIndex = 0;
  bool seeMore = false;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _widthAnimation = Tween<double>(begin: 60, end: 300).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Container> _bodyItem = [
      Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Icon(
          Icons.home_filled,
          size: 80,
          color: Color(0xff8274FF),
        ),
      ),
      Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Icon(
          Icons.person,
          size: 80,
          color: Color(0xff8274FF),
        ),
      ),
    ];

    return Scaffold(
      body: _bodyItem[_currentIndex],
      bottomSheet: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                seeMore = false;
                _removeOverlay();
              });
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _bottomItem(0, Icons.home),
                    const SizedBox(width: 10),
                    _bottomItem(1, Icons.person),
                  ],
                )),
          ),
          Positioned(
            top: -30,
            child: Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: const Color(0xff8274FF),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff19181D).withOpacity(0.8),
                        spreadRadius: 7,
                        offset: Offset(0, 2),
                      )
                    ]),
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          seeMore = !seeMore;
                          if (seeMore) {
                            _animationController.forward();
                            _showOverlay(context);
                          } else {
                            _animationController.reverse();
                            Timer(const Duration(milliseconds: 400), () {
                              _removeOverlay();
                            });
                          }
                        });
                      },
                      icon: RotationTransition(
                        turns: _opacityAnimation,
                        child: Icon(
                          seeMore
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          size: 40,
                        ),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  // Show overlay
  void _showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom: 110,
          left: 0,
          right: 0,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                      width: _widthAnimation.value,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xff1D1B20),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: _opacityAnimation.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _overlayButton(Icons.inbox, () {}),
                            _overlayButton(Icons.settings, () {}),
                            _overlayButton(Icons.search, () {}),
                            _overlayButton(Icons.logout, () {}),
                          ],
                        ),
                      ));
                },
              ),
            ),
          ),
        );
      },
    );
    overlay.insert(_overlayEntry!);
  }

  // Remove overlay
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // Bottom Item widget
  Widget _bottomItem(int thisIndex, IconData icons) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = thisIndex;
          seeMore = false;
          _removeOverlay();
        });
      },
      child: Icon(
        icons,
        color:
            _currentIndex == thisIndex ? const Color(0xff8274FF) : Colors.white,
      ),
    );
  }

  Widget _overlayButton(IconData icons, VoidCallback onPress) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Icon(
          icons,
          color: Colors.white,
        ),
      ),
    );
  }
}
