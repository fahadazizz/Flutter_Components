import 'package:flutter/material.dart';

class CustomAnimatedParallelEffect extends StatefulWidget {
  const CustomAnimatedParallelEffect({super.key});

  @override
  State<CustomAnimatedParallelEffect> createState() =>
      _CustomAnimatedParallelEffectState();
}

class _CustomAnimatedParallelEffectState
    extends State<CustomAnimatedParallelEffect> {
  PageController pageController = PageController(viewportFraction: 0.6);

  double pageOffSet = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        pageOffSet = pageController.page!;
      });
      debugPrint(pageOffSet.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  final List<ParallexModel> _items = [
    ParallexModel(image: 'assets/mountain1.jpg', title: 'Mountain 1'),
    ParallexModel(image: 'assets/mountain2.jpg', title: 'Mountain 2'),
    ParallexModel(image: 'assets/mountain3.jpg', title: 'Mountain 3'),
    ParallexModel(image: 'assets/mountain4.jpg', title: 'Mountain 4'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Parallel Effect'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: PageView.builder(
              controller: pageController,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                List<ParallexModel> _showItem = _items;
                debugPrint("${-pageOffSet.abs() + index}");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.asset(
                            '${_showItem[index].image}',
                            fit: BoxFit.cover,
                            alignment: Alignment(-pageOffSet.abs() + index, 0),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              '${_showItem[index].title}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class ParallexModel {
  String? image;
  String? title;

  ParallexModel({required this.image, required this.title});
}
