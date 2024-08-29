import 'package:fancy_animated_snackbar/fancy_animated_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAnimatedDialogboxCode extends StatefulWidget {
  final String titleText;
  final String description;
  final String topImage;
  final Color textColor;
  final Color dialogBackColor;
  final Color buttonColor;
  final VoidCallback onPress;

  CustomAnimatedDialogboxCode({
    required this.titleText,
    required this.description,
    required this.topImage,
    required this.textColor,
    required this.dialogBackColor,
    required this.buttonColor,
    required this.onPress,
  });

  @override
  State<CustomAnimatedDialogboxCode> createState() =>
      _CustomAnimatedDialogboxCodeState();
}

class _CustomAnimatedDialogboxCodeState
    extends State<CustomAnimatedDialogboxCode>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _fadeOutAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _fadeOutAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FadeTransition(
        opacity: _fadeInAnimation,
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 45,
              height: 330,
              decoration: BoxDecoration(
                color: widget.dialogBackColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(),
                  Text(
                    softWrap: true,
                    widget.titleText,
                    style: GoogleFonts.nerkoOne(
                      textStyle: TextStyle(
                          fontSize: 38,
                          color: widget.textColor.withOpacity(0.85),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.description,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 13,
                        color: widget.textColor.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Buttons(
                      text: 'Ok',
                      onPress: widget.onPress,
                      buttonColor: widget.buttonColor),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -75,
              child: Container(
                padding: EdgeInsets.all(10),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: widget.dialogBackColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    widget.topImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color buttonColor;

  Buttons({
    required this.text,
    required this.onPress,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: buttonColor,
        ),
        width: 130,
        height: 40,
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAnimatedDialogbox {
  static void customAnimatedDialogBox(BuildContext context) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Align(
          alignment: Alignment.center,
          child: CustomAnimatedDialogboxCode(
            titleText: 'Welcome',
            description:
                'This is Custom Animated Dialog Box developed by Fahad Aziz',
            topImage: 'assets/done.png',
            textColor: Colors.white,
            dialogBackColor: Colors.black87,
            buttonColor: Color(0xff2BC67A),
            onPress: () {
              CustomAnimatedDialogbox box0 = CustomAnimatedDialogbox();
              box0.removeLayout(overlayEntry);
            },
          ),
        );
      },
    );

    overlay.insert(overlayEntry);

    Future.delayed(
      const Duration(seconds: 5),
      () {
        CustomAnimatedDialogbox box = CustomAnimatedDialogbox();
        box.removeLayout(overlayEntry);
      },
    );
  }

  void removeLayout(OverlayEntry overlayEntry) {
    overlayEntry.remove();
  }
}

class UsingCustomAnimatedDialogBox extends StatelessWidget {
  const UsingCustomAnimatedDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              CustomAnimatedDialogbox.customAnimatedDialogBox(context);
            },
            child: Text('Check Dialog Box')),
      ),
    );
  }
}
