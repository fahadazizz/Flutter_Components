import 'package:flutter/material.dart';

class CustomRollingAnimatedSwitch extends StatefulWidget {
  const CustomRollingAnimatedSwitch({super.key});

  @override
  State<CustomRollingAnimatedSwitch> createState() =>
      _CustomRollingAnimatedSwitchState();
}

class _CustomRollingAnimatedSwitchState
    extends State<CustomRollingAnimatedSwitch> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _leftTextOpacityAnimation;
  late Animation<double> _rightTextOpacityAnimation;

  bool _checkAnimation = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // Slide animation for the button
    _slideAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(2.5, 0)).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut));

    // Opacity for the left "Turn OFF" text (fades in)
    _leftTextOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Opacity for the right "Turn ON" text (fades out)
    _rightTextOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                // Background container for the switch
                Container(
                  width: 160,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: FadeTransition(
                          opacity: _rightTextOpacityAnimation,
                          child: Text(
                            "Turn ON",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FadeTransition(
                          opacity: _leftTextOpacityAnimation,
                          child: Text(
                            "Turn OFF",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Sliding button
                SlideTransition(
                  position: _slideAnimation,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _checkAnimation = true;
                        if (_animationController.isCompleted) {
                          _animationController.reverse();
                          _checkAnimation = false;
                        } else {
                          _animationController.forward();
                          _checkAnimation = true;
                        }
                      });
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: _checkAnimation == true
                            ? Colors.amberAccent
                            : Colors.white,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: _checkAnimation == true
                          ? const Icon(
                              Icons.offline_bolt_outlined,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.offline_bolt,
                              color: Colors.black,
                            ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
