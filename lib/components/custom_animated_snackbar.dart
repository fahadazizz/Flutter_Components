import 'package:flutter/material.dart';

class CustomAnimatedSnackbar extends StatelessWidget {
  String? title;
  String? subTitile;
  IconData? icon;
  Color? backColor;
  double? height;

  CustomAnimatedSnackbar(
      {required this.height,
      required this.title,
      required this.subTitile,
      required this.icon,
      required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 32, // Adjust for margins
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            height: height,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Space for any leading icon or widget
                SizedBox(width: 40),
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero, // Remove extra padding
                    title: Text(
                      '$title',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '$subTitile',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      softWrap: true,
                    ),
                    trailing: Icon(icon, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            left: 10,
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.favorite, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  final overly = Overlay.of(context);
  final overLayEntert = OverlayEntry(
    builder: (context) => Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.all(14),
            child: CustomAnimatedSnackbar(
                height: 80,
                title: 'Welcome',
                subTitile: 'This is first Snackbar',
                icon: Icons.cancel_outlined,
                backColor: Colors.purple))),
  );

  overly.insert(overLayEntert);

  Future.delayed(Duration(seconds: 3), () {
    overLayEntert.remove();
  });
}

class UsingCustomAnimatedSnackabar extends StatelessWidget {
  const UsingCustomAnimatedSnackabar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showSnackBar(context);
            },
            child: Text('Check Snackbar')),
      ),
    );
  }
}
