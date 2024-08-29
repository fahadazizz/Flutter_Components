import 'package:fancy_animated_snackbar/fancy_animated_snackbar.dart';
import 'package:flutter/material.dart';

class CustomAnimatedDialogboxCode extends StatefulWidget {
  @override
  State<CustomAnimatedDialogboxCode> createState() =>
      _CustomAnimatedDialogboxCodeState();
}

class _CustomAnimatedDialogboxCodeState
    extends State<CustomAnimatedDialogboxCode> {
  @override
  Widget build(BuildContext context) {
    return Material();
  }
}

class CustomAnimatedDialogbox {
  static void cutomAnimatedDialogBox(BuildContext context) {
    final overLay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Align(
            alignment: Alignment.center, child: CustomAnimatedDialogboxCode());
      },
    );

    overLay.insert(overlayEntry);
    Future.delayed(
      Duration(seconds: 3),
      () {
        overlayEntry.remove();
      },
    );
  }
}

class UsingCustomAnimatedDialogBox extends StatelessWidget {
  const UsingCustomAnimatedDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 340,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Spacer(),
                  Text('Welcome'),
                  Text('Welcome'),
                  Buttons(text: 'Ok', onPress: () {}),
                ],
              ),
            ),
            Positioned(
              top: -75,
              child: Container(
                padding: EdgeInsets.all(10),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/done.png',
                    fit: BoxFit.cover,
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

class Buttons extends StatelessWidget {
  String? text;
  VoidCallback onPress;

  Buttons({required this.text, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
