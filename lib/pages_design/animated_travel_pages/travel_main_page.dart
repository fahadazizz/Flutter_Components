import 'package:flutter/material.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/travel_page_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

// use light theme in app
class TravelMainPage extends StatelessWidget {
  const TravelMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            AppBarTravelMainPage(),
            Expanded(
              flex: 14,
              child: SizedBox(
                child: Column(
                  children: [
                    _titleText(context),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best Destination',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextButton(onPressed: () {}, child: Text('View more')),
                      ],
                    ),
                    SlidingContentTravelPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // top title text
  Widget _titleText(BuildContext context) {
    return RichText(
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
                fontWeight: FontWeight.w600,
              ),
        ),
        TextSpan(
          text: 'world!',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
        ),
      ]),
    );
  }
}

class AppBarTravelMainPage extends StatelessWidget {
  const AppBarTravelMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListTile(
        leading: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            color: Color(0xffFFEADF),
          ),
          child: SvgPicture.asset(
            'assets/pages_images/userLogo.svg',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'Leonardo',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class SlidingContentTravelPage extends StatefulWidget {
  const SlidingContentTravelPage({super.key});

  @override
  State<SlidingContentTravelPage> createState() =>
      _SlidingContentTravelPageState();
}

class _SlidingContentTravelPageState extends State<SlidingContentTravelPage> {
  PageController pageController = PageController(viewportFraction: 0.75);

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

  @override
  Widget build(BuildContext context) {
    List<TravelPageModel> _slidingContent = [
      TravelPageModel(
        image: 'assets/mountain1.jpg',
        name: 'Niladri Reservoir',
        place: 'Tekergat, Sunamgnj',
        rating: '4.6',
      ),
      TravelPageModel(
        image: 'assets/mountain2.jpg',
        name: 'Niladri Reservoir',
        place: 'Tekergat, Sunamgnj',
        rating: '4.6',
      ),
      TravelPageModel(
        image: 'assets/mountain3.jpg',
        name: 'Niladri Reservoir',
        place: 'Tekergat, Sunamgnj',
        rating: '4.6',
      ),
      TravelPageModel(
        image: 'assets/mountain4.jpg',
        name: 'Niladri Reservoir',
        place: 'Tekergat, Sunamgnj',
        rating: '4.6',
      ),
    ];
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: PageView.builder(
        controller: pageController,
        itemCount: _slidingContent.length,
        itemBuilder: (context, index) {
          return SlidingContentDesign(
            image: _slidingContent[index].image,
            name: _slidingContent[index].name,
            rating: _slidingContent[index].rating,
            place: _slidingContent[index].place,
            index: index,
            offset: pageOffSet,
          );
        },
      ),
    );
  }
}

class SlidingContentDesign extends StatelessWidget {
  final String? image;
  final String? name;
  final String? rating;
  final String? place;
  final int index;
  final double offset;

  SlidingContentDesign({
    required this.image,
    required this.name,
    required this.rating,
    required this.place,
    required this.index,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7, // Increased width
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                  alignment: Alignment(-offset + index, 0), // Adjust alignment
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text(
                    name!,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(rating!),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text(place!),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
