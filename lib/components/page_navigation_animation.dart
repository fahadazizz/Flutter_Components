import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageNavigationAnimation extends StatelessWidget {
  const PageNavigationAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buttons('Fade Animation Transition', () {
              Navigator.push(
                context,
                _fadeNavigation(
                  FadeAnimationCheckpage(),
                ),
              );
            }),
            _buttons('Scale Animation Transition', () {
              Navigator.push(
                context,
                _scaleNavigation(
                  ScaleAnimationCheckpage(),
                ),
              );
            }),
            _buttons('Scale Animation Transition to Left', () {
              Navigator.push(
                context,
                _slideNavigation(SlideAnimationCheckpage(), -1, 0),
              );
            }),
            _buttons('Scale Animation Transition to Right', () {
              Navigator.push(
                context,
                _slideNavigation(SlideAnimationCheckpage(), 1, 0),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buttons(String text, VoidCallback onPress) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: onPress,
        child: Text('$text'),
      ),
    );
  }
}

// fade animation check
class FadeAnimationCheckpage extends StatelessWidget {
  const FadeAnimationCheckpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Fade Animatin Transition Page'),
      ),
    );
  }
}

class ScaleAnimationCheckpage extends StatelessWidget {
  const ScaleAnimationCheckpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Scale Animation Transition Page'),
      ),
    );
  }
}

class SlideAnimationCheckpage extends StatelessWidget {
  const SlideAnimationCheckpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Slide Animation Transition Page'),
      ),
    );
  }
}

// animation for page navigation
PageRouteBuilder _fadeNavigation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondryAnimation) {
      var tween =
          Tween(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeInOut));
      var offsetAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: animation,
        child: page,
      );
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

PageRouteBuilder _scaleNavigation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondryAnimation) {
      var tween =
          Tween(begin: 0, end: 2).chain(CurveTween(curve: Curves.easeInOut));
      var offsetAnimation = animation.drive(tween);

      return ScaleTransition(
        scale: animation,
        child: page,
      );
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: animation,
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 500),
  );
}

PageRouteBuilder _slideNavigation(Widget page, double begin, double end) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondryAnimation) {
      var tween = Tween(begin: Offset(begin, 0), end: Offset(end, 0))
          .chain(CurveTween(curve: Curves.easeInOut));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: page,
      );
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween(begin: Offset(begin, 0), end: Offset(end, 0))
            .animate(animation),
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 800),
  );
}
