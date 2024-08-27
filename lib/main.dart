// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_components/components/custom_animated_crousel_scroll.dart';
import 'package:flutter_components/components/custom_rotated_card.dart';
import 'package:flutter_components/components/first_contained_bottom_navigation_bar.dart';
import 'package:flutter_components/main_home_page.dart';
import 'package:flutter_components/using_custom_package/first_animated_carousel_scroll.dart';
import 'package:provider/provider.dart';

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
    return MaterialApp(theme: ThemeData.dark(), home: CustomRotatedCard());
  }
}
