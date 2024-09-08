import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

class AppBarTravelMainPage extends StatelessWidget {
  AnimationController animationController;

  AppBarTravelMainPage({required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: animationController, curve: Curves.easeIn),
        ),
        child: SlideTransition(
          position:
              Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn),
          ),
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
        ),
      ),
    );
  }
}
