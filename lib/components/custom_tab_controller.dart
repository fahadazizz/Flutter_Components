import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabController extends StatefulWidget {
  @override
  State<CustomTabController> createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  Color mainColor = Color(0xFF8C6EC4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 120,
          margin: EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tabBars('Home', 0),
              _tabBars('Status', 1),
              _tabBars('Group', 2),
              _tabBars('Calls', 3),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            child: PageView.builder(
              controller: _pageController,
              itemCount: itemPage.length,
              itemBuilder: (context, index) {
                return itemPage[index];
              },
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
            ),
          ),
        ),
      ],
    ));
  }

  List<Widget> get itemPage {
    return [
      _items('assets/Logo.png'),
      _items('assets/Logo.png'),
      _items('assets/Logo.png'),
      _items('assets/Logo.png'),
    ];
  }

  // tab bars
  Widget _tabBars(String text, int thisIndex) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _pageController.animateToPage(
              thisIndex,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
            setState(() {
              _currentIndex = thisIndex;
            });
          },
          child: Container(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Text(
              '$text',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Container(
            width: _currentIndex == thisIndex ? 60 : 0,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: mainColor),
          ),
        ),
      ],
    );
  }

  // page items
  Widget _items(String image) {
    return SizedBox(
      width: 300,
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('$image'),
      ),
    );
  }
}
