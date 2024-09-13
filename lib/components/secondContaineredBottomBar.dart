import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondContaineredBottomBar extends StatefulWidget {
  const SecondContaineredBottomBar({super.key});

  @override
  State<SecondContaineredBottomBar> createState() =>
      _SecondContaineredBottomBarState();
}

class _SecondContaineredBottomBarState
    extends State<SecondContaineredBottomBar> {
  int _currentIndex = 0;
  PageController _pageController = PageController(); // Add PageController

  // Function to set the page using PageController with animation
  void setPage(int value) {
    setState(() {
      _currentIndex = value;
      _pageController.animateToPage(
        value,
        duration:
            Duration(milliseconds: 300), // Adjust the duration for smoothness
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView to handle page transitions with swipe and animation
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  '1',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '2',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '3',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '4',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _bottomNavigationItems(
                    Icons.home_outlined,
                    0,
                    _currentIndex,
                    () => setPage(0),
                  ),
                  _bottomNavigationItems(
                    Icons.category_outlined,
                    1,
                    _currentIndex,
                    () => setPage(1),
                  ),
                  _bottomNavigationItems(
                    Icons.create_outlined,
                    2,
                    _currentIndex,
                    () => setPage(2),
                  ),
                  _bottomNavigationItems(
                    Icons.person_outline_outlined,
                    3,
                    _currentIndex,
                    () => setPage(3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for custom bottom app bar items with animation (Scale and Opacity)
  Widget _bottomNavigationItems(
      IconData icon, int index, int currentIndex, VoidCallback onPress) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: onPress,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Animation duration
        width: isSelected ? 70 : 60, // Scale up selected icon
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Icon(
            icon,
            color: isSelected ? Colors.black : Colors.white,
            size: isSelected ? 28 : 24, // Increase size for selected icon
          ),
        ),
      ),
    );
  }
}
