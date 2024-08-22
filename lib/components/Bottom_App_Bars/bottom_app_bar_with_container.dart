import 'package:flutter/material.dart';

class BottomAppBarWithContainers extends StatefulWidget {
  const BottomAppBarWithContainers({super.key});

  @override
  State<BottomAppBarWithContainers> createState() =>
      _CustomBottomNavWithContainerState();
}

class _CustomBottomNavWithContainerState
    extends State<BottomAppBarWithContainers> {
  int _currentIndex = 0;
  void checkItem(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List Pages = [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Text("1"),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Text("2"),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Text("3"),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Text("4"),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom bottom nav with container"),
      ),
      body: Pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.withOpacity(0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                checkItem(0);
              },
              child: AnimatedOpacity(
                opacity: _currentIndex == 0 ? 1.0 : 0.6,
                duration: Duration(seconds: 1),
                child: Container(
                  width: _currentIndex == 0 ? 90 : 30,
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:
                        _currentIndex == 0 ? Colors.white : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.home),
                      _currentIndex == 0 ? Text("Home") : Text(""),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                checkItem(1);
              },
              child: AnimatedOpacity(
                opacity: _currentIndex == 1 ? 1 : 0.6,
                duration: Duration(seconds: 1),
                child: Container(
                  width: _currentIndex == 1 ? 90 : 30,
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:
                        _currentIndex == 1 ? Colors.white : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.inbox),
                      _currentIndex == 1 ? Text("Inbox") : Text(""),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                checkItem(2);
              },
              child: AnimatedOpacity(
                opacity: _currentIndex == 2 ? 1 : 0.6,
                duration: Duration(seconds: 1),
                child: Container(
                  width: _currentIndex == 2 ? 90 : 30,
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:
                        _currentIndex == 2 ? Colors.white : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.search),
                      _currentIndex == 2 ? Text("Search") : Text(""),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                checkItem(3);
              },
              child: AnimatedOpacity(
                opacity: _currentIndex == 3 ? 1 : 0.6,
                duration: Duration(seconds: 1),
                child: Container(
                  width: _currentIndex == 3 ? 90 : 30,
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:
                        _currentIndex == 3 ? Colors.white : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person),
                      _currentIndex == 3 ? Text("Person") : Text(""),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
