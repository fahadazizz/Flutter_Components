import 'package:flutter/material.dart';
import 'package:fancy_animated_snackbar/fancy_animated_snackbar.dart';

class FancyAnimatedSnackbar extends StatelessWidget {
  const FancyAnimatedSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  fancyAnimatedSnackbar(
                    context,
                    title: 'Welcome',
                    subTitle:
                        'This is implementation of Fancy Animated Snackbar',
                    snackIcon: Icons.favorite_border,
                    snackIconBack: Colors.redAccent.shade200,
                    snackBackColor: Colors.red.shade900,
                    alignment: Alignment.bottomCenter,
                    duration: const Duration(seconds: 4),
                  );
                },
                child: Text('Using Snackbar')),
          ],
        ),
      ),
    );
  }
}
