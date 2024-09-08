import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconButtonDetialPage extends StatelessWidget {
  AnimationController animationController;
  IconButtonDetialPage({required this.animationController});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _iconButton(
                Icons.arrow_back,
                () {
                  Navigator.pop(context);
                },
              ),
              Text(
                'Details',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
              ),
              _iconButton(
                Icons.bookmark_border_outlined,
                () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onPress) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Color(0xff7D848D).withOpacity(0.4),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
