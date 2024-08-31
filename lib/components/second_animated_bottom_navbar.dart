import 'package:fancy_animated_snackbar/fancy_animated_snackbar.dart';
import 'package:flutter/material.dart';

class SecondAnimatedBottomNavbar extends StatefulWidget {
  const SecondAnimatedBottomNavbar({super.key});

  @override
  State<SecondAnimatedBottomNavbar> createState() =>
      _SecondAnimatedBottomNavbarState();
}

class _SecondAnimatedBottomNavbarState
    extends State<SecondAnimatedBottomNavbar> {
  int _currentIndex = 0;

  bool searchMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                searchMore = false;
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
                    _bottomItem(1, Icons.inbox),
                    const SizedBox(
                      width: 10,
                    ),
                    _bottomItem(2, Icons.settings),
                    _bottomItem(3, Icons.person),
                  ],
                )),
          ),
          Positioned(
            top: -30,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  searchMore = !searchMore;
                });
              },
              child: Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: const Color(0xff8274FF),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff1D1B20),
                        spreadRadius: 6,
                        offset: Offset(0, 4),
                      )
                    ]),
                child: Icon(
                  searchMore
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  size: 40,
                ),
              ),
            ),
          ),
          Positioned(
              top: -85,
              child: Visibility(
                visible: searchMore,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white10,
                  ),
                  alignment: Alignment.center,
                  child: const Text('Welcome'),
                ),
              )),
        ],
      ),
    );
  }

  Widget _bottomItem(int thisIndex, IconData icons) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = thisIndex;
        });
      },
      child: Icon(
        icons,
        color: _currentIndex == thisIndex ? Color(0xff8274FF) : Colors.white,
      ),
    );
  }
}

class SecondAnimatedBottomSearchItem extends StatelessWidget {
  const SecondAnimatedBottomSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 55,
        child: Text('welcome'),
      ),
    );
  }
}

class SecondAnimatedBottomSearchItemOverlay {
  final overlay = Overlay();
  late OverlayEntry overlayEntry;

  static void showSearchContent() {
    overLayEntry = OverlayEntry(
      builder: (context) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: const SecondAnimatedBottomSearchItem());
      },
    );
  }
}
