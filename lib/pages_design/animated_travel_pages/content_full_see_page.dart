import 'package:flutter/material.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/item_detial_component/content_detial_component.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/item_detial_component/elevated_button_travle_page.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/item_detial_component/iconButton.dart';

class ContentFullSeePage extends StatefulWidget {
  String? image;
  String? name;
  String? place;
  String? rating;
  String? people;
  String? description;

  ContentFullSeePage({
    required this.image,
    required this.name,
    required this.place,
    required this.rating,
    required this.people,
    required this.description,
  });

  @override
  State<ContentFullSeePage> createState() => _ContentFullSeePageState();
}

class _ContentFullSeePageState extends State<ContentFullSeePage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        '${widget.image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        IconButtonDetialPage(
                            animationController: _animationController),
                        Spacer(),
                        SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(0, 1), end: Offset(0, 0))
                              .animate(
                            CurvedAnimation(
                                parent: _animationController,
                                curve: Curves.easeInOut),
                          ),
                          child: Container(
                            height: 350,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32),
                                topLeft: Radius.circular(32),
                              ),
                            ),
                            child: Column(
                              children: [
                                ContentDetailComponent(
                                  image: widget.image,
                                  name: widget.name,
                                  place: widget.place,
                                  rating: widget.rating,
                                  people: widget.people,
                                  description: widget.description,
                                ),
                                Spacer(),
                                ElevatedButtonTravlePage(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              })),
    );
  }
}
