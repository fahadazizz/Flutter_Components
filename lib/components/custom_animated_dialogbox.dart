import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAnimatedDialogboxCode extends StatefulWidget {
  final String titleText;
  final String description;
  final String butText;
  final String topImage;
  final Color textColor;
  final Color dialogBackColor;
  final Color buttonBackColor;
  final Color buttonTextColor;
  final VoidCallback onPress;
  final Duration animationDuration;
  final bool check;

  CustomAnimatedDialogboxCode({
    required this.titleText,
    required this.description,
    required this.butText,
    required this.topImage,
    required this.textColor,
    required this.dialogBackColor,
    required this.buttonBackColor,
    required this.buttonTextColor,
    required this.animationDuration,
    required this.onPress,
    required this.check,
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
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _sizeAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    if (widget.check) {
      _animationController.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    _animationController.dispose();
    super.dispose();
  }

  void handleOnPress() {
    if (_animationController.isAnimating) return;

    _animationController.reverse().then((_) {
      widget.onPress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScaleTransition(
        scale: _sizeAnimation,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    SizedBox(
                      height: 30,
                    ),
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: Text(
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
                    ),
                    Spacer(),
                    Buttons(
                      text: '${widget.butText}',
                      onPress: handleOnPress,
                      buttonColor: widget.buttonBackColor,
                      buttonTextColor: widget.buttonTextColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -70,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 140,
                  height: 140,
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
      ),
    );
  }
}

// button to use on dialog box
class Buttons extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color buttonColor;
  final Color buttonTextColor;

  Buttons({
    required this.text,
    required this.onPress,
    required this.buttonColor,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: buttonColor,
            boxShadow: [
              BoxShadow(
                color: buttonColor.withOpacity(0.5),
                blurRadius: 12,
                spreadRadius: 1,
                offset: Offset(0, 0),
              )
            ]),
        width: 130,
        height: 40,
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 16,
              color: buttonTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAnimatedDialogbox {
  static void showSuccessDialog(
    BuildContext context, {
    required String? title, // Required parameter
    required String? description,
    required String? buttonText,
    String? topImage,
    Color? dialogBackColor,
    Color? textColor,
    Color? buttonTextColor,
    Color? buttonColor,
    Duration? animationDuration,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Align(
          alignment: Alignment.center,
          child: CustomAnimatedDialogboxCode(
            titleText: title ?? 'Welcome',
            description: description ??
                'This is Custom Animated Dialog Box developed by Fahad Aziz',
            butText: buttonText ?? 'Ok',
            topImage: topImage ?? 'assets/done.png',
            textColor: textColor ?? Colors.white,
            dialogBackColor: dialogBackColor ?? Colors.black,
            buttonBackColor: buttonColor ?? Colors.pinkAccent,
            buttonTextColor: buttonTextColor ?? Colors.white,
            animationDuration:
                animationDuration ?? const Duration(milliseconds: 400),
            onPress: () {
              overlayEntry.remove();
            },
            check: true,
          ),
        );
      },
    );

    overlay.insert(overlayEntry);
  }
}

class UsingCustomAnimatedDialogBox extends StatelessWidget {
  const UsingCustomAnimatedDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  CustomAnimatedDialogbox.showSuccessDialog(
                    context,
                    title: 'Welcome',
                    description:
                        'This is Custom Animated Dialog Box Developed by Fahad Aziz',
                    buttonText: 'OK',
                    dialogBackColor: Colors.white,
                    textColor: Colors.black87,
                    buttonColor: Color(0xff2BC67A),
                  );
                },
                child: const Text('Check Dialog Box')),
          ],
        ),
      ),
    );
  }
}
