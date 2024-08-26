import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstContainedBottomNavigationBar extends StatefulWidget {
  const FirstContainedBottomNavigationBar({super.key});

  @override
  State<FirstContainedBottomNavigationBar> createState() =>
      _FirstContainedBottomNavigationBarState();
}

class _FirstContainedBottomNavigationBarState
    extends State<FirstContainedBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final containedProvider =
        Provider.of<FirstContainedBottomNavigationBarProvider>(context);
    // list of body
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
        child: Icon(
          Icons.wallet,
          size: 80,
          color: Color(0xff8274FF),
        ),
      ),
      Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Icon(
          Icons.pie_chart,
          size: 80,
          color: Color(0xff8274FF),
        ),
      ),
      Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Icon(
          Icons.settings,
          size: 80,
          color: Color(0xff8274FF),
        ),
      ),
    ];

    // main code
    return Scaffold(
      body: _bodyItem[containedProvider.currentIndex],
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _bottomNavItem(0, Icons.home, 'Home'),
            _bottomNavItem(1, Icons.wallet, 'Wallet'),
            _bottomNavItem(2, Icons.pie_chart, 'Chart'),
            _bottomNavItem(3, Icons.settings, 'Seting'),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavItem(int thisIndex, IconData icon, String data) {
    final containedProvider =
        Provider.of<FirstContainedBottomNavigationBarProvider>(context);
    return GestureDetector(
      onTap: () {
        containedProvider.setIndex(thisIndex);
      },
      child: Container(
        width: containedProvider.currentIndex == thisIndex ? 75 : 35,
        height: 40,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: containedProvider.currentIndex == thisIndex
              ? const Color(0xff7F71FF).withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: AnimatedOpacity(
          opacity: containedProvider.currentIndex == thisIndex ? 1.0 : 0.5,
          duration: Duration(milliseconds: 600),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color: containedProvider.currentIndex == thisIndex
                    ? Color(0xff8274FF)
                    : Colors.white70,
              ),
              Text(
                '${containedProvider.currentIndex == thisIndex ? data : ""}',
                style: TextStyle(
                  color: containedProvider.currentIndex == thisIndex
                      ? Color(0xff8274FF)
                      : Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstContainedBottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
