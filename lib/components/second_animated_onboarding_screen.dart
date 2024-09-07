import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SecondAnimatedOnboardingScreen extends StatefulWidget {
  const SecondAnimatedOnboardingScreen({super.key});

  @override
  State<SecondAnimatedOnboardingScreen> createState() =>
      _SecondAnimatedOnboardingScreenState();
}

class _SecondAnimatedOnboardingScreenState
    extends State<SecondAnimatedOnboardingScreen> {
  @override
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
          'To get the best of your adventure you just need to leave and go where you like. we are waiting for you',
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
                    itemCount: _items.length,
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
              flex: 4,
              child: Container(
                width: double.infinity,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondOnboardDesign extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              '$image',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: '$title',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text: specialText,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffFF7029))),
          ])),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          '$desc',
          style: Theme.of(context).textTheme.bodyLarge,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ],
    );
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
