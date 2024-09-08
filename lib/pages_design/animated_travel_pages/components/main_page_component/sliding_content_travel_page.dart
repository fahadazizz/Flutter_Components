import 'package:flutter/material.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/main_page_component/travel_page_model.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/content_full_see_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidingContentTravelPage extends StatefulWidget {
  AnimationController animationController;
  SlidingContentTravelPage({required this.animationController});

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
          people: '43',
          description:
              'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC...'),
      TravelPageModel(
          image: 'assets/mountain2.jpg',
          name: 'Niladri Reservoir',
          place: 'Tekergat, Sunamgnj',
          rating: '4.6',
          people: '55',
          description:
              'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC...'),
      TravelPageModel(
          image: 'assets/mountain3.jpg',
          name: 'Niladri Reservoir',
          place: 'Tekergat, Sunamgnj',
          rating: '4.6',
          people: '38',
          description:
              'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC...'),
      TravelPageModel(
          image: 'assets/mountain4.jpg',
          name: 'Niladri Reservoir',
          place: 'Tekergat, Sunamgnj',
          rating: '4.6',
          people: '59',
          description:
              'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC...'),
    ];
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: widget.animationController, curve: Curves.easeIn),
      ),
      child: SlideTransition(
        position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
          CurvedAnimation(
              parent: widget.animationController, curve: Curves.easeInOut),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: PageView.builder(
                controller: pageController,
                itemCount: _slidingContent.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentFullSeePage(
                              image: _slidingContent[index].image,
                              name: _slidingContent[index].name,
                              place: _slidingContent[index].place,
                              rating: _slidingContent[index].rating,
                              people: _slidingContent[index].people,
                              description: _slidingContent[index].description),
                        ),
                      );
                    },
                    child: SlidingContentDesign(
                      image: _slidingContent[index].image,
                      name: _slidingContent[index].name,
                      rating: _slidingContent[index].rating,
                      place: _slidingContent[index].place,
                      people: _slidingContent[index].people,
                      desc: _slidingContent[index].description,
                      index: index,
                      offset: pageOffSet,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlidingContentDesign extends StatelessWidget {
  final String? image;
  final String? name;
  final String? rating;
  final String? place;
  final String? people;
  final String? desc;
  final int index;
  final double offset;

  SlidingContentDesign({
    required this.image,
    required this.name,
    required this.rating,
    required this.place,
    required this.people,
    required this.desc,
    required this.index,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9, // Increased width
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
