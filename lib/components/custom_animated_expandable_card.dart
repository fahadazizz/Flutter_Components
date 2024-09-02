import 'package:flutter/material.dart';

class ExpandableCard extends StatefulWidget {
  const ExpandableCard({super.key});

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard>
    with SingleTickerProviderStateMixin {
  // animation controller
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;
  late Animation<double> _opactityAnimation;

  // component content
  final String userName = 'Fahad Aziz';
  final String passion = 'App Developer';
  final Image insta = Image.asset('assets/insta.png');
  final Image github = Image.asset('assets/github.png');
  final Image linkedin = Image.asset('assets/linkedin.png');
  final Image dev = Image.asset('assets/dev.png', fit: BoxFit.contain);

  // components color
  Color borderColor = Color(0xff8274FF);
  Color mainColor = Colors.white;

  bool isFull = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _heightAnimation = Tween<double>(begin: 70, end: 430).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _opactityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    super.initState();
  }

  void _toggleCard() {
    setState(() {
      if (isFull) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }

      isFull = !isFull;
    });
  }

  @override
  void dispose() {
    _animationController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Replace Flexible with Expanded in your code
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              if (isFull) {
                return Expanded(
                  child: Container(
                    height: _heightAnimation.value,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FadeTransition(
                      opacity: _opactityAnimation,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                    onPressed: _toggleCard,
                                    icon: Icon(
                                      Icons.keyboard_arrow_up,
                                      size: 24,
                                      color: mainColor,
                                    )),
                              ),
                              SizedBox(
                                height: 200,
                                child: ClipRRect(
                                  child: Image.asset('assets/dev.png'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '$userName',
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '$passion',
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _rowItem(Image.asset('assets/linkedin.png'),
                                  'https://www.linkedin.com/in/fahad-aziz-khan-2a1723261/'),
                              _rowItem(Image.asset('assets/github.png'),
                                  'https://github.com/fahadazizz'),
                              _rowItem(Image.asset('assets/insta.png'),
                                  'https://instagram.com/fahadazizz'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                  height: _heightAnimation.value,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: borderColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/dev.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      _space(10, 0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$userName',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$passion',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      _space(80, 0),
                      IconButton(
                        onPressed: _toggleCard,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 24,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }

  Widget _space(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  Widget _rowItem(Image icon, String url) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 800),
      opacity: _opactityAnimation.value,
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 6),
        child: Row(
          children: [
            SizedBox(width: 24, height: 24, child: icon),
            const SizedBox(width: 3),
            Flexible(
              flex: 1,
              child: Text(
                url,
                style: TextStyle(color: mainColor, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
