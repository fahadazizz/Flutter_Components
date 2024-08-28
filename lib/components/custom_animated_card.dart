import 'package:flutter/material.dart';

class CustomAnimatedCard extends StatefulWidget {
  const CustomAnimatedCard({super.key});

  @override
  State<CustomAnimatedCard> createState() => _CustomAnimatedCardState();
}

class _CustomAnimatedCardState extends State<CustomAnimatedCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _transfromAnimationOne;
  late Animation<double> _transfromAnimationTwo;
  bool isExpanded = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _transfromAnimationOne = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _transfromAnimationTwo = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
                if (isExpanded) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              });
            },
            child: Stack(
              children: [
                AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return AnimatedOpacity(
                        opacity: isExpanded ? 1 : 0,
                        duration: Duration(milliseconds: 600),
                        child: Transform(
                          transform: Matrix4.rotationX(
                              _transfromAnimationOne.value * 1.65),
                          child: Container(
                            margin: EdgeInsets.all(12),
                            height: 200,
                            color: Colors.pink,
                          ),
                        ),
                      );
                    }),
                AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return AnimatedOpacity(
                        opacity: isExpanded ? 0 : 1,
                        duration: Duration(milliseconds: 600),
                        child: Transform(
                          transform: Matrix4.rotationX(
                              _transfromAnimationTwo.value * 1.5708),
                          child: Container(
                            margin: EdgeInsets.all(12),
                            height: 400,
                            color: Colors.pink,
                            child: Column(
                              children: [
                                Image.asset('assets/dev.png'),
                                _rowItem(Image.asset('assets/github.p'),
                                    'http/ihaoi-aga/dgad'),
                                _rowItem(Image.asset('assets/github.p'),
                                    'http/ihaoi-aga/dgad'),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowItem(Image icon, String url) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, top: 6),
      child: Row(
        children: [
          SizedBox(width: 24, height: 24, child: icon),
          const SizedBox(width: 3),
          Flexible(
            flex: 1,
            child: Text(
              url,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
