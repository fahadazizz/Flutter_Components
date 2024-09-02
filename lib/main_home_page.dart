// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_components/components/custom_animated_crousel_scroll.dart';
import 'package:flutter_components/components/custom_animated_dialogbox.dart';
import 'package:flutter_components/components/custom_animated_snackbar.dart';
import 'package:flutter_components/components/custom_like_button.dart';
import 'package:flutter_components/components/custom_circular_progress_indicator.dart';
import 'package:flutter_components/components/custom_shimmer_effect.dart';
import 'package:flutter_components/components/first_contained_bottom_navigation_bar.dart';
import 'package:flutter_components/components/first_onBoarding_screen.dart';
import 'package:flutter_components/components/password_authenticator_field.dart';
import 'package:flutter_components/components/custom_animated_expandable_card.dart';
import 'package:flutter_components/components/tab_base_navigation.dart';
import 'package:flutter_components/main_button.dart';

import 'components/custom_animated_slide_button.dart';
import 'components/custom_tab_controller.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // list of buttons
    List<MainButton> button = [
      MainButton(
        data: 'Custom Tab Controller',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomTabController(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Expanded Card',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExpandableCard(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Contained bottom Nav',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FirstContainedBottomNavigationBar(),
            ),
          );
        },
      ),
      MainButton(
        data: 'First OnBoarding Screen',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FirstOnBoardingScreen(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Password Authenticator Field',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordAuthenticatorField(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Custom shimmer effect',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomShimmerEffect(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Custom Like Button',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomLikeButton(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Custom Progress Indicator',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CustomCircularProgressIndicator(progressValue: 0.6),
            ),
          );
        },
      ),
      MainButton(
        data: 'Custom Animated Image Scroll View',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomAnimatedCrouselScroll(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Custom Animated SnackBar',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UsingCustomAnimatedSnackabar(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Custom Animated Dialog Box',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UsingCustomAnimatedDialogBox(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Custom Tab Base Navigation',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TabBaseNavigation(),
            ),
          );
        },
      ),
      MainButton(
        data: 'Custom Slider Button',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckAnimatedSlideButton(),
            ),
          );
        },
      ),
    ];

    // main code
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Component Page'),
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
