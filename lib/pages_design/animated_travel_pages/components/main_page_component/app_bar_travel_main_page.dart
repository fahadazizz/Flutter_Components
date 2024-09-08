import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

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
