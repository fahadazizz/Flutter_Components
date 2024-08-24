import 'package:flutter/material.dart';
import 'package:flutter_components/components/first_contained_bottom_navigation_bar.dart';
import 'package:flutter_components/main_home_page.dart';
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
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainHomePage(),
    );
  }
}
