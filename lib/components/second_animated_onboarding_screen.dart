import 'package:flutter/material.dart';

class SecondAnimatedOnboardingScreen extends StatefulWidget {
  const SecondAnimatedOnboardingScreen({super.key});

  @override
  State<SecondAnimatedOnboardingScreen> createState() =>
      _SecondAnimatedOnboardingScreenState();
}

class _SecondAnimatedOnboardingScreenState
    extends State<SecondAnimatedOnboardingScreen> {
  @override
  PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<SecondOnboardModel> _items = [
    SecondOnboardModel(
      image: 'assets/secondOnboard1.png',
      title: 'Life is short and the world is ',
      specialText: 'wide',
      desc:
          'At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations all over the world',
    ),
    SecondOnboardModel(
      image: 'assets/secondOnboard2.png',
      title: 'It’s a big world out there go ',
      specialText: 'explore',
      desc:
          'To get the best of your adventure you just need to leave and go where you like. we are waiting for you',
    ),
    SecondOnboardModel(
      image: 'assets/secondOnboard3.png',
      title: 'People don’t take trips, trips take ',
      specialText: 'people',
      desc:
          'At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations all over the world',
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 14,
              child: SizedBox(
                width: double.infinity,
                height: 600,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: _items.length,
                    onPageChanged: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return SecondOnboardDesign(
                        image: _items[index].image,
                        title: _items[index].title,
                        specialText: _items[index].specialText,
                        desc: _items[index].desc,
                      );
                    }),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _onBoardContainer(0),
                        _onBoardContainer(1),
                        _onBoardContainer(2),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.decelerate,
                            );
                          });
                        },
                        child: const Text('Welcome')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _onBoardContainer(int thisIndex) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _currentIndex == thisIndex ? 22 : 12,
      height: 12,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: _currentIndex == thisIndex ? Colors.blueAccent : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

// onboard design class
class SecondOnboardDesign extends StatefulWidget {
  String? image;
  String? title;
  String? specialText;
  String? desc;

  SecondOnboardDesign(
      {required this.image,
      required this.title,
      required this.specialText,
      required this.desc});

  @override
  State<SecondOnboardDesign> createState() => _SecondOnboardDesignState();
}

class _SecondOnboardDesignState extends State<SecondOnboardDesign>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<Offset> _descSlideAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _titleSlideAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _descSlideAnimation =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      '${widget.image}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SlideTransition(
                  position: _titleSlideAnimation,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: '${widget.title}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: widget.specialText,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffFF7029))),
                      ])),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SlideTransition(
                  position: _descSlideAnimation,
                  child: Text(
                    '${widget.desc}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class SecondOnboardModel {
  String? image;
  String? title;
  String? specialText;
  String? desc;

  SecondOnboardModel(
      {required this.image,
      required this.title,
      required this.specialText,
      required this.desc});
}
