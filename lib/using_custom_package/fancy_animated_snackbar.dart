import 'package:flutter/material.dart';

class FancyAnimatedSnackbar extends StatelessWidget {
  const FancyAnimatedSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Using Snackbar')),
          ],
        ),
      ),
    );
  }
}
