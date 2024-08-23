import 'package:flutter/material.dart';

class ExpandableCard extends StatefulWidget {
  ExpandableCard({super.key});

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;
  late Animation<double> _opacityAnimation;

  bool seeFull = false;
  final String userName = 'Fahad Aziz';
  final String passion = 'App Development';
  final Image insta = Image.asset('assets/insta.png');
  final Image github = Image.asset('assets/github.png');
  final Image linkedin = Image.asset('assets/linkedin.png');
  final Image dev = Image.asset('assets/dev.png', fit: BoxFit.contain);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _heightAnimation = Tween<double>(begin: 55, end: 430).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCard() {
    setState(() {
      if (seeFull) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
      seeFull = !seeFull;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebe9ff),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff8274FF).withOpacity(0.7),
                      offset: Offset(0, 4),
                      blurRadius: 14,
                    ),
                  ],
                ),
                height: _heightAnimation.value,
                child: Column(
                  children: [
                    if (seeFull) ...[
                      const SizedBox(
                        height: 12,
                      ),
                      ClipRRect(
                        child: dev,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(8)),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Expanded(
                        child: FadeTransition(
                          opacity: _opacityAnimation,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      userName,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff8274FF),
                                      ),
                                    ),
                                    Text(
                                      passion,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff8274FF),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 18),
                                _rowItem(
                                    linkedin, 'https://linkedin/fahad-aziz'),
                                _rowItem(github, 'https://github/fahad-aziz'),
                                _rowItem(insta, 'https://instagram/fahad-aziz'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      Padding(
                        padding: EdgeInsets.only(left: 12, right: 12, top: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff8274FF),
                              ),
                            ),
                            IconButton(
                              onPressed: _toggleCard,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 32,
                                color: Color(0xff8274FF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _rowItem(Image icon, String url) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Row(
        children: [
          SizedBox(width: 24, height: 24, child: icon),
          const SizedBox(width: 3),
          Text(
            url,
            style: TextStyle(
                color: Color(0xff8274FF), fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
