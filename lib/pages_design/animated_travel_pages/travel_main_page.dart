import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

import 'components/main_page_component/sliding_content_travel_page.dart';

// use light theme in app
class TravelMainPage extends StatelessWidget {
  const TravelMainPage({super.key});

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
                    _titleText(context),
                    const SizedBox(
                      height: 36,
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
    );
  }

  // top title text
  Widget _titleText(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: 'Explore the ',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Color(0xff2E323E),
                fontWeight: FontWeight.w300,
              ),
        ),
        TextSpan(
          text: 'Beautiful ',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
        ),
        TextSpan(
          text: 'world!',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
        ),
      ]),
    );
  }
}

class AppBarTravelMainPage extends StatelessWidget {
  const AppBarTravelMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListTile(
        leading: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            color: Color(0xffFFEADF),
          ),
          child: SvgPicture.asset(
            'assets/pages_images/userLogo.svg',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'Leonardo',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
