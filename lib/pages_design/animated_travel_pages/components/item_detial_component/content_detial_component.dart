import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

class ContentDetailComponent extends StatelessWidget {
  String? image;
  String? name;
  String? place;
  String? rating;
  String? people;
  String? description;

  ContentDetailComponent({
    required this.image,
    required this.name,
    required this.place,
    required this.rating,
    required this.people,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            '$name',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          subtitle: Text(
            '$place',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
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
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 20,
              ),
              Text(
                '$place',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
              ),
              Spacer(),
              Icon(
                Icons.star,
                size: 22,
                color: Colors.amber,
              ),
              Text(
                '$rating',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
              ),
              Spacer(),
              Text(
                '$people',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent,
                )),
              ),
              Text(
                ' /Person',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text:
                    'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC... ',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextSpan(
                text: 'Read More',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          )),
        )
      ],
    );
  }
}
