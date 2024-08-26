import 'package:flutter/material.dart';

class CustomAnimatedScrollWheel extends StatefulWidget {
  const CustomAnimatedScrollWheel({super.key});

  @override
  State<CustomAnimatedScrollWheel> createState() =>
      _CustomAnimatedScrollWheelState();
}

class _CustomAnimatedScrollWheelState extends State<CustomAnimatedScrollWheel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 300,
                    color: Colors.white10,
                    margin: EdgeInsets.all(12),
                  );
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
