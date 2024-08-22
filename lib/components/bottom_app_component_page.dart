import 'package:flutter/material.dart';
import 'package:flutter_components/components/Bottom_App_Bars/bottom_app_bar_with_container.dart';
import 'package:flutter_components/main_button.dart';

class BottomAppComponentPage extends StatelessWidget {
  const BottomAppComponentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // list
    List<MainButton> but = [
      MainButton(
          data: 'Bottom App Bar with Container',
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomAppBarWithContainers(),
              ),
            );
          })
    ];

    // main code
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom App Bar'),
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
