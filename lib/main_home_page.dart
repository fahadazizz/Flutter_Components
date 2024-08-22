import 'package:flutter/material.dart';
import 'package:flutter_components/components/Account/password_authenticator_field.dart';
import 'package:flutter_components/components/account_component_page.dart';
import 'package:flutter_components/components/onBoarding_screens.dart';
import 'package:flutter_components/main_button.dart';

import 'components/bottom_app_component_page.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // list of buttons
    List<MainButton> button = [
      MainButton(
        data: 'Bottom App Bar',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomAppComponentPage(),
            ),
          );
        },
      ),
      MainButton(
        data: 'On Boarding Screens',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingScreens(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Account',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AccountComponentPage(),
            ),
          );
        },
      ),
    ];

    // main code
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: ListView.builder(
              itemCount: button.length,
              itemBuilder: (context, index) {
                List<MainButton> but = button;
                return but[index];
              })),
    );
  }
}
