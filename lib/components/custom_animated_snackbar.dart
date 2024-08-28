import 'package:flutter/material.dart';

class CustomAnimatedSnackbar extends StatefulWidget {
  final String title;
  final String subTitile;
  final IconData snackIcon;
  final Color? backColor;
  final Color? snackIconBack;
  final Color? snackIconFront;
  final Color? snackTextColor;
  final bool show;
  final Alignment? align;

  CustomAnimatedSnackbar({
    super.key,
    required this.snackIcon,
    required this.title,
    required this.subTitile,
    required this.backColor,
    this.snackIconBack,
    this.snackIconFront,
    this.snackTextColor,
    required this.show,
    required this.align,
  });

  @override
  _CustomAnimatedSnackbarState createState() => _CustomAnimatedSnackbarState();
}

class _CustomAnimatedSnackbarState extends State<CustomAnimatedSnackbar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _positionAnimation;

  double begignAnimate = 0;
  double endAnimate = 4;
  @override
  void initState() {
    if (widget.align == Alignment.bottomCenter) {
      begignAnimate = 0;
      endAnimate = 4;
    } else if (widget.align == Alignment.center) {
      begignAnimate = 4;
      endAnimate = 0;
    } else if (widget.align == Alignment.topCenter) {
      begignAnimate = 4;
      endAnimate = 4;
    } else {
      begignAnimate = 0;
      endAnimate = 4;
    }
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        if (_animationController.isCompleted) {
          Future.delayed(Duration(seconds: 3), () {
            _animationController.reverse();
          });
        }
      });

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _positionAnimation = Tween<Offset>(
      begin: Offset(begignAnimate, endAnimate),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    if (widget.show) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomAnimatedSnackbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.show != oldWidget.show) {
      if (widget.show) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _positionAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Material(
          color: widget.backColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 32,
                // Adjust for margins
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                height: 80,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Space for any leading icon or widget
                    const SizedBox(width: 50),
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero, // Remove extra padding
                        title: Text(
                          widget.title,
                          style: TextStyle(
                            color: widget.snackTextColor ?? Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          widget.subTitile,
                          style: TextStyle(
                            color: widget.snackTextColor ?? Colors.white,
                            fontSize: 12,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -20,
                left: 10,
                child: Container(
                  width: 45,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.snackIconBack ?? Colors.pink,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(widget.snackIcon, color: widget.snackIconFront),
                ),
              ),
              Positioned(
                top: 5,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      overLayEntry!.remove();
                      _animationController.reverse();
                    });
                  },
                  child: Icon(Icons.done_sharp, color: widget.snackIconFront),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// snackbar show method
OverlayEntry? overLayEntry;
void showSnackBar(BuildContext context) {
  final overly = Overlay.of(context);
  overLayEntry = OverlayEntry(
    builder: (context) => Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: CustomAnimatedSnackbar(
          snackIcon: Icons.favorite,
          snackIconBack: Color(0xff1A521D),
          title: 'Welcome',
          subTitile:
              'This is first Custom Animated SnackBar developed by Fahad Aziz',
          snackTextColor: Colors.white,
          backColor: Color(0xff239328),
          show: true,
          align: Alignment.bottomCenter,
        ),
      ),
    ),
  );

  overly.insert(overLayEntry!);

  Future.delayed(Duration(seconds: 4), () {
    overLayEntry!.remove();
  });
}

// show snackbar class
class UsingCustomAnimatedSnackabar extends StatelessWidget {
  const UsingCustomAnimatedSnackabar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showSnackBar(context);
            },
            child: Text('Check Snackbar')),
      ),
    );
  }
}
