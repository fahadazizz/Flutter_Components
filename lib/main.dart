// ignore_for_file: unused_import

import 'package:fancy_animated_snackbar/fancy_animated_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components/components/custom_animated_crousel_scroll.dart';
import 'package:flutter_components/components/custom_animated_card.dart';
import 'package:flutter_components/components/custom_animated_dialogbox.dart';
import 'package:flutter_components/components/custom_animated_slide_button.dart';
import 'package:flutter_components/components/custom_animated_snackbar.dart';
import 'package:flutter_components/components/first_contained_bottom_navigation_bar.dart';
import 'package:flutter_components/components/page_navigation_animation.dart';
import 'package:flutter_components/components/second_animated_overlay_bottom_navbar.dart';
import 'package:flutter_components/components/tab_base_navigation.dart';
import 'package:flutter_components/main_home_page.dart';
import 'package:flutter_components/using_custom_package/fancy_animated_snackbar.dart';
import 'package:flutter_components/using_custom_package/first_animated_carousel_scroll.dart';
import 'package:provider/provider.dart';

import 'components/custom_circular_progress_indicator.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SecondAnimatedOverlayBottomNavbar(),
    );
  }
}
