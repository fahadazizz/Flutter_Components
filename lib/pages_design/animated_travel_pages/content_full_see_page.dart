import 'package:flutter/material.dart';
import 'package:flutter_components/pages_design/animated_travel_pages/components/main_page_component/app_bar_travel_main_page.dart';
import 'package:svg_flutter/svg.dart';

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
            child: SvgPicture.asset(
              '$image',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: AppBarTravelMainPage()),
              Spacer(),
              Container(
                height: 400,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('$name'),
                      subtitle: Text('$place'),
                      trailing: Container(
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
