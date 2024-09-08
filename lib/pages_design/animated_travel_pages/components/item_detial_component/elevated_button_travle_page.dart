import 'package:flutter/material.dart';
import 'package:flutter_components/components/custom_animated_snackbar.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/travel_main_page.dart';

class ElevatedButtonTravlePage extends StatelessWidget {
  const ElevatedButtonTravlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          maximumSize: Size(double.infinity, 55),
          minimumSize: Size(double.infinity, 55),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TravelMainPage(),
            ),
          );
        },
        child: const Text('Book Now'));
  }
}
