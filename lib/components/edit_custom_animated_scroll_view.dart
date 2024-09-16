import 'package:flutter/material.dart';

class CustomAnimatedScrollView extends StatelessWidget {
  const CustomAnimatedScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 1.2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 3,
              child: ListWheelScrollView(itemExtent: 100, children: [
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.redAccent,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.yellow,
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}