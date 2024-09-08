import 'package:flutter/material.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/main_page_component/bottom_app_bar_travel_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

import 'components/main_page_component/app_bar_travel_main_page.dart';
import 'components/main_page_component/sliding_content_travel_page.dart';
import 'components/main_page_component/title_main_page_text_component.dart';

// use light theme in app
class TravelMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            AppBarTravelMainPage(),
            Expanded(
              flex: 14,
              child: SizedBox(
                child: Column(
                  children: [
                    TitleMainPageTextComponent(),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best Destination',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View more',
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                            )),
                      ],
                    ),
                    SlidingContentTravelPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomAppBarTravelPage(),
    );
  }
}
