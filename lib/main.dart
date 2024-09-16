// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_components/components/custom_animated_crousel_scroll.dart';
import 'package:flutter_components/components/custom_animated_card.dart';
import 'package:flutter_components/components/custom_animated_dialogbox.dart';
import 'package:flutter_components/components/custom_animated_image_shile_show.dart';
import 'package:flutter_components/components/custom_animated_paralele_effect.dart';
import 'package:flutter_components/components/custom_animated_rating_box.dart';
import 'package:flutter_components/components/custom_instagram_like_button.dart';
import 'package:flutter_components/components/edit_custom_animated_scroll_view.dart';
import 'package:flutter_components/components/custom_animated_slide_button.dart';
import 'package:flutter_components/components/custom_animated_snackbar.dart';
import 'package:flutter_components/components/custom_designed_animated_onboard_screen.dart';
import 'package:flutter_components/components/custom_otp_field.dart';
import 'package:flutter_components/components/custom_rolling_animated_switch.dart';
import 'package:flutter_components/components/first_contained_bottom_navigation_bar.dart';
import 'package:flutter_components/components/page_navigation_animation.dart';
import 'package:flutter_components/components/secondContaineredBottomBar.dart';
import 'package:flutter_components/components/second_animated_onboarding_screen.dart';
import 'package:flutter_components/components/second_animated_overlay_bottom_navbar.dart';
import 'package:flutter_components/components/tab_base_navigation.dart';
import 'package:flutter_components/main_home_page.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/travel_main_page.dart';
import 'package:flutter_components/using_custom_package/fancy_animated_snackbar.dart';
import 'package:flutter_components/using_custom_package/first_animated_carousel_scroll.dart';
import 'package:flutter_components/components/email_validation_form.dart';
import 'package:provider/provider.dart';

import 'components/animated_shadow_elevated_button.dart';
import 'components/custom_circular_progress_indicator.dart';
import 'components/custom_like_button.dart';
import 'components/custom_second_bottom_nav_bar.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => FirstContainedBottomNavigationBarProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: CustomInstagramLikeButton(),
    );
  }
}
