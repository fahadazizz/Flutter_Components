import 'package:flutter/material.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/main_page_component/bottom_app_bar_travel_page.dart';

import 'components/main_page_component/app_bar_travel_main_page.dart';
import 'components/main_page_component/sliding_content_travel_page.dart';
import 'components/main_page_component/title_main_page_text_component.dart';

// use light theme in app
class TravelMainPage extends StatefulWidget {
  @override
  State<TravelMainPage> createState() => _TravelMainPageState();
}

class _TravelMainPageState extends State<TravelMainPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Column(
                  children: [
                    AppBarTravelMainPage(
                      animationController: _animationController,
                    ),
                    Expanded(
                      flex: 14,
                      child: SizedBox(
                        child: Column(
                          children: [
                            TitleMainPageTextComponent(
                              animationController: _animationController,
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Best Destination',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
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
                            SlidingContentTravelPage(
                              animationController: _animationController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              })),
      bottomSheet: BottomAppBarTravelPage(),
    );
  }
}
