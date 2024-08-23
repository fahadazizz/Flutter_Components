import 'package:flutter/material.dart';
import 'package:flutter_components/components/Navigators/custom_tab_controller.dart';
import 'package:flutter_components/main_button.dart';

import 'Navigators/first_contained_bottom_navigation_bar.dart';

class DifferentNavigator extends StatelessWidget {
  const DifferentNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    // list of buttons
    List<MainButton> but = [
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
        data: 'First Contained BottomNav',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FirstContainedBottomNavigationBar(),
            ),
          );
        },
      ),
    ];

    // main code
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigators'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: ListView.builder(
              itemCount: but.length,
              itemBuilder: (context, index) {
                return but[index];
              })),
    );
  }
}
