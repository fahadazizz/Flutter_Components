import 'package:flutter/material.dart';

class TitleMainPageTextComponent extends StatelessWidget {
  const TitleMainPageTextComponent({super.key});

  @override
  Widget build(BuildContext context) {
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
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
        ),
        TextSpan(
          text: 'world!',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 38,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
        ),
      ]),
    );
  }
}
