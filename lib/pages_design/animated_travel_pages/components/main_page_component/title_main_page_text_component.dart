import 'package:flutter/material.dart';

class TitleMainPageTextComponent extends StatelessWidget {
  AnimationController animationController;

  TitleMainPageTextComponent({required this.animationController});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn),
      ),
      child: SlideTransition(
        position:
            Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
        ),
        child: RichText(
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
        ),
      ),
    );
  }
}
