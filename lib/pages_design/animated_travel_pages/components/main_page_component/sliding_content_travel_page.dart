import 'package:flutter/material.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/main_page_component/travel_page_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidingContentTravelPage extends StatefulWidget {
  const SlidingContentTravelPage({super.key});

  @override
  State<SlidingContentTravelPage> createState() =>
      _SlidingContentTravelPageState();
}

class _SlidingContentTravelPageState extends State<SlidingContentTravelPage> {
  PageController pageController = PageController(viewportFraction: 0.85);

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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    rating!,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black38,
                    ),
                    Text(
                      place!,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black38,
                        ),
                      ),
                    ),
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
