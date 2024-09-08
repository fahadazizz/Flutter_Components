import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

class BottomAppBarTravelPage extends StatelessWidget {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.none,
      color: Colors.white54,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomItem(0, 'assets/pages_images/homeIcon.svg', 'Home'),
          _bottomItem(1, 'assets/pages_images/calenderIcon.svg', 'Calender'),
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              color: Colors.blueAccent,
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          _bottomItem(2, 'assets/pages_images/messageIcon.svg', 'Messages'),
          _bottomItem(3, 'assets/pages_images/profileIcon.svg', 'Profile'),
        ],
      ),
    );
  }

  Widget _bottomItem(int thisIndex, String icon, String text) {
    return Column(
      children: [
        SvgPicture.asset(
          '$icon',
          color: _currentIndex == thisIndex
              ? Colors.blueAccent
              : Color(0xff7D848D),
        ),
        Text(
          '$text',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontSize: 12,
            color: _currentIndex == thisIndex
                ? Colors.blueAccent
                : Color(0xff7D848D),
          )),
        )
      ],
    );
  }
}
