import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TabBaseNavigation extends StatefulWidget {
  const TabBaseNavigation({super.key});

  @override
  State<TabBaseNavigation> createState() => _TabBaseNavigationState();
}

class _TabBaseNavigationState extends State<TabBaseNavigation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pageAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _pageAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _colorAnimation =
        ColorTween(begin: Colors.black, end: const Color(0xff8274FF)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    super.initState();
  }

  int _currentItem = 0;

  void setItem(index) {
    setState(() {
      _currentItem = index;
      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List of pages
    List pages = [
      _buildPage(context, Icons.home_filled),
      _buildPage(context, Icons.wallet),
      _buildPage(context, Icons.pie_chart),
      _buildPage(context, Icons.settings),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            dragStartBehavior: DragStartBehavior.down,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  _headers(0, 'Home'),
                  _headers(1, 'Wallet'),
                  _headers(2, 'Charts'),
                  _headers(3, 'Setting'),
                ],
              ),
            ),
          ),
          // Use Expanded to prevent overflow
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 10),
              child: FadeTransition(
                opacity: _pageAnimation,
                child: pages[_currentItem],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // pages to show
  Widget _buildPage(BuildContext context, IconData icon) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Icon(
        icon,
        size: 80,
        color: Color(0xff8274FF),
      ),
    );
  }

  // header bar containing tab
  Widget _headers(int index, String text) {
    return GestureDetector(
      onTap: () {
        setItem(index);
      },
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return NavItems(
            title: text,
            front: _currentItem == index ? Colors.white : Colors.white,
            back:
                _currentItem == index ? _colorAnimation.value : Colors.black87,
          );
        },
      ),
    );
  }
}

// navigation button
class NavItems extends StatelessWidget {
  final String title;
  final Color? back;
  final Color front;
  const NavItems({
    required this.title,
    required this.back,
    required this.front,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: 100,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xff8274FF).withOpacity(0.5)),
        color: back,
      ),
      child: RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
            color: front,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
