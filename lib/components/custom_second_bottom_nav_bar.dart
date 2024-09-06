import 'package:flutter/material.dart';

class BottomNavCustomTabView extends StatefulWidget {
  const BottomNavCustomTabView({super.key});

  @override
  State<BottomNavCustomTabView> createState() => _BottomNavCustomTabViewState();
}

class _BottomNavCustomTabViewState extends State<BottomNavCustomTabView> {
  int _currentIndex = 0;
  void checkItem(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        child: Pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: BottomAppBar(
          color: Colors.grey.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _columnItem(0, Icons.home),
              _columnItem(1, Icons.inbox),
              _columnItem(2, Icons.settings),
              _columnItem(3, Icons.person),
            ],
          ),
        ),
      ),
    );
  }

  Widget _columnItem(int thisIndex, IconData icon) {
    return Stack(
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                checkItem(thisIndex);
              },
              icon: Icon(icon),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              alignment: Alignment.centerLeft,
              width: 60,
              height: 3,
              color: _currentIndex == thisIndex
                  ? Colors.pinkAccent
                  : Colors.transparent,
            ),
          ],
        ),
        Visibility(
          visible: _currentIndex == thisIndex ? true : false,
          child: Positioned(
            bottom: 15,
            child: Opacity(
              opacity: 0.4,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 60,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.pinkAccent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List Pages = [
  Container(
    alignment: Alignment.center,
    child: Text("1"),
  ),
  Container(
    alignment: Alignment.center,
    child: Text("2"),
  ),
  Container(
    alignment: Alignment.center,
    child: Text("3"),
  ),
  Container(
    alignment: Alignment.center,
    child: Text("4"),
  ),
];
