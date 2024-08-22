import 'package:flutter/material.dart';
import 'package:flutter_components/components/onBoarding_screens/first_onBoarding_screen.dart';
import 'package:flutter_components/main_button.dart';

class OnBoardingScreens extends StatelessWidget {
  const OnBoardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    List<MainButton> but = [
      MainButton(
          data: 'First OnBoarding Screen',
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstOnBoardingScreen(),
              ),
            );
          }),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Boarding Screens'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: but.length,
          itemBuilder: (context, index) {
            return but[index];
          }),
    );
  }
}
