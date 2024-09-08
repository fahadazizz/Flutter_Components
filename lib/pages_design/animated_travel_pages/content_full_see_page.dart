import 'package:flutter/material.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/item_detial_component/content_detial_component.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/item_detial_component/iconButton.dart';

class ContentFullSeePage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              '$image',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              IconButtonDetialPage(),
              Spacer(),
              ContentDetailComponent(
                image: image,
                name: name,
                place: place,
                rating: rating,
                people: people,
                description: description,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
