import 'package:flutter/material.dart';

class FirstOnBoardingScreen extends StatefulWidget {
  @override
  State<FirstOnBoardingScreen> createState() => _FirstOnBoardingScreenState();
}

class _FirstOnBoardingScreenState extends State<FirstOnBoardingScreen> {
  int _currentIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: 130,
                  height: 65,
                  child: Image.asset(
                    'assets/onBoardLogo.png',
                    fit: BoxFit.cover,
                  )),
            ),
            _space(15, 0),
            SizedBox(
              width: 275,
              height: 305,
              child: Image.asset(
                'assets/onBoardImage.png',
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            _onBoarding(context),
          ],
        ),
      ),
    );
  }

  Widget _onBoarding(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xFF326DDF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: PageView.builder(
              controller: pageController,
              itemCount: pageViewItem.length,
              itemBuilder: (context, index) {
                return pageViewItem[index];
              },
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
            ),
          ),
          _space(20, 0),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      transform: _currentIndex == 0
                          ? Matrix4.rotationY(10)
                          : Matrix4.rotationY(0),
                      transformAlignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        width: _currentIndex == 0 ? 32 : 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      transform: _currentIndex == 1
                          ? Matrix4.rotationY(10)
                          : Matrix4.rotationY(0),
                      transformAlignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        width: _currentIndex == 1 ? 32 : 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      transform: _currentIndex == 2
                          ? Matrix4.rotationY(10)
                          : Matrix4.rotationY(0),
                      transformAlignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        width: _currentIndex == 2 ? 32 : 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
                _space(0, 155),
                GestureDetector(
                  onTap: () {
                    pageController.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeOutBack);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF326DDF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get pageViewItem {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _text('Earn More Money', FontWeight.bold, 22),
          _space(3, 0),
          _text(
              'Trade smarter with [App Name] and see your profits soar.Get started now and take control of your financial future!',
              FontWeight.normal,
              14),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _text('Do trade in just Taps', FontWeight.bold, 22),
          _space(3, 0),
          _text(
              'Effortlessly manage your investments with [App Name]. Start now and simplify your trading journey!',
              FontWeight.normal,
              14),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _text('Learn by trading Demo', FontWeight.bold, 22),
          _space(3, 0),
          _text(
              'Practice strategies and refine your skills risk-free. Start today and build confidence before you trade live!',
              FontWeight.normal,
              14),
        ],
      ),
    ];
  }

  Widget _text(String text, FontWeight weight, double size) {
    return SizedBox(
      width: 290,
      child: Text(
        '$text',
        style: TextStyle(
          fontWeight: weight,
          color: Colors.white,
          fontSize: size,
        ),
      ),
    );
  }

  Widget _space(double height, double width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
