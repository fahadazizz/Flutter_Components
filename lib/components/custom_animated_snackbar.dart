import 'package:flutter/material.dart';

class AnimatedSnackBar extends StatefulWidget {
  final String title;
  final String subTitile;
  final IconData snackIcon;
  final Color? backColor;
  final Color? snackIconBack;
  final Color? snackIconFront;
  final Color? snackTextColor;
  final bool show;
  final Alignment? align;
  final Duration? duration;

  AnimatedSnackBar(
      {super.key,
      required this.snackIcon,
      required this.title,
      required this.subTitile,
      required this.backColor,
      this.snackIconBack,
      this.snackIconFront,
      this.snackTextColor,
      required this.show,
      required this.align,
      required this.duration});

  @override
  _AnimatedSnackBarState createState() => _AnimatedSnackBarState();
}

class _AnimatedSnackBarState extends State<AnimatedSnackBar>
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
      begignAnimate = 0;
      endAnimate = -4;
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
          Future.delayed(widget.duration ?? const Duration(seconds: 3), () {
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
  void didUpdateWidget(AnimatedSnackBar oldWidget) {
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
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
                            color: widget.snackTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          widget.subTitile,
                          style: TextStyle(
                            color: widget.snackTextColor,
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
                    color: widget.snackIconBack,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(widget.snackIcon, color: widget.snackIconFront),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///
//
//
class CustomAnimatedSnackbar {
  // status Ok
  static void successSnackbar(
    BuildContext context, {
    required String? title,
    required String? subTitle,
    IconData? snackIcon,
    Color? snackBackColor,
    Alignment? alignment,
    Color? snackIconBack,
    Color? snackIconFront,
    Color? snackTextColor,
    Duration? duration,
  }) {
    OverlayEntry? overLayEntry;
    final overly = Overlay.of(context);
    overLayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: alignment ?? Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: AnimatedSnackBar(
            snackIcon: snackIcon ?? Icons.favorite_border,
            title: title ?? 'Welcome',
            subTitile: subTitle ??
                'This is Custom Animated Snackbar made by Fahad Aziz',
            snackIconFront: snackIconFront ?? Colors.white,
            snackIconBack: snackIconBack ?? Colors.green,
            backColor: snackBackColor ?? Color(0xff256528),
            snackTextColor: snackTextColor ?? Colors.white,
            show: true,
            align: alignment,
            duration: duration,
          ),
        ),
      ),
    );

    overly.insert(overLayEntry!);

    Future.delayed(duration ?? const Duration(seconds: 4), () {
      overLayEntry!.remove();
    });
  }

  //
// error snackbar
  static void errorSnackbar(
    BuildContext context, {
    required String? title,
    required String? subTitle,
    IconData? snackIcon,
    Color? snackBackColor,
    Alignment? alignment,
    Color? snackIconBack,
    Color? snackIconFront,
    Color? snackTextColor,
    Duration? duration,
  }) {
    OverlayEntry? overLayEntry;
    final overly = Overlay.of(context);
    overLayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: alignment ?? Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: AnimatedSnackBar(
            snackIcon: snackIcon ?? Icons.error,
            title: title ?? 'Welcome',
            subTitile: subTitle ??
                'This is Custom Animated Snackbar made by Fahad Aziz',
            snackIconFront: snackIconFront ?? Colors.white,
            snackIconBack: snackIconBack ?? Colors.red,
            backColor: snackBackColor ?? Color(0xffB00020),
            snackTextColor: snackTextColor ?? Colors.white,
            show: true,
            align: alignment,
            duration: duration,
          ),
        ),
      ),
    );

    overly.insert(overLayEntry!);

    Future.delayed(duration ?? const Duration(seconds: 4), () {
      overLayEntry!.remove();
    });
  }

  //
// info snackbar
  static void infoSnackbar(
    BuildContext context, {
    required String? title,
    required String? subTitle,
    IconData? snackIcon,
    Color? snackBackColor,
    Alignment? alignment,
    Color? snackIconBack,
    Color? snackIconFront,
    Color? snackTextColor,
    Duration? duration,
  }) {
    OverlayEntry? overLayEntry;
    final overly = Overlay.of(context);
    overLayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: alignment ?? Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: AnimatedSnackBar(
            snackIcon: snackIcon ?? Icons.insert_drive_file_outlined,
            title: title ?? 'Welcome',
            subTitile: subTitle ??
                'This is Custom Animated Snackbar made by Fahad Aziz',
            snackIconFront: snackIconFront ?? Colors.white,
            snackIconBack: snackIconBack ?? Colors.blue,
            backColor: snackBackColor ?? Colors.blue[800],
            snackTextColor: snackTextColor ?? Colors.white,
            show: true,
            align: alignment,
            duration: duration,
          ),
        ),
      ),
    );

    overly.insert(overLayEntry);

    Future.delayed(duration ?? const Duration(seconds: 4), () {
      overLayEntry!.remove();
    });
  }

  //
// warning snackbar
  static void warningSnackbar(
    BuildContext context, {
    required String? title,
    required String? subTitle,
    IconData? snackIcon,
    Color? snackBackColor,
    Alignment? alignment,
    Color? snackIconBack,
    Color? snackIconFront,
    Color? snackTextColor,
    Duration? duration,
  }) {
    OverlayEntry? overLayEntry;
    final overly = Overlay.of(context);
    overLayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: alignment ?? Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: AnimatedSnackBar(
            snackIcon: snackIcon ?? Icons.warning,
            title: title ?? 'Welcome',
            subTitile: subTitle ??
                'This is Custom Animated Snackbar made by Fahad Aziz',
            snackIconFront: snackIconFront ?? Colors.black,
            snackIconBack: snackIconBack ?? Colors.orange,
            backColor: snackBackColor ?? Colors.orange[800],
            snackTextColor: snackTextColor ?? Colors.white,
            show: true,
            align: alignment,
            duration: duration,
          ),
        ),
      ),
    );

    overly.insert(overLayEntry!);

    Future.delayed(duration ?? const Duration(seconds: 4), () {
      overLayEntry!.remove();
    });
  }

  //
// warning snackbar
  static void loadingSnackbar(
    BuildContext context, {
    required String? title,
    required String? subTitle,
    IconData? snackIcon,
    Color? snackBackColor,
    Alignment? alignment,
    Color? snackIconBack,
    Color? snackIconFront,
    Color? snackTextColor,
    Duration? duration,
  }) {
    OverlayEntry? overLayEntry;
    final overly = Overlay.of(context);
    overLayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: alignment ?? Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: AnimatedSnackBar(
            snackIcon: snackIcon ?? Icons.refresh,
            title: title ?? 'Welcome',
            subTitile: subTitle ??
                'This is Custom Animated Snackbar made by Fahad Aziz',
            snackIconFront: snackIconFront ?? Colors.white,
            snackIconBack: snackIconBack ?? Colors.grey,
            backColor: snackBackColor ?? Colors.grey[800],
            snackTextColor: snackTextColor ?? Colors.white,
            show: true,
            align: alignment,
            duration: duration,
          ),
        ),
      ),
    );

    overly.insert(overLayEntry!);

    Future.delayed(duration ?? const Duration(seconds: 4), () {
      overLayEntry!.remove();
    });
  }
}

//
//
// show snackbar class
class UsingCustomAnimatedSnackabar extends StatelessWidget {
  const UsingCustomAnimatedSnackabar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                CustomAnimatedSnackbar.successSnackbar(
                  context,
                  title: 'Welcome',
                  subTitle: 'This is Success Snackbar developed by Fahad Aziz',
                  duration: Duration(seconds: 3),
                  snackIcon: Icons.done,
                );
              },
              child: Text('Success Snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomAnimatedSnackbar.errorSnackbar(
                  context,
                  title: 'Welcome',
                  subTitle: 'This is Error Snackbar developed by Fahad Aziz',
                  duration: Duration(seconds: 3),
                  snackIcon: Icons.error,
                );
              },
              child: Text('Error Snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomAnimatedSnackbar.infoSnackbar(
                  context,
                  title: 'Welcome',
                  subTitle: 'This is Info Snackbar developed by Fahad Aziz',
                  duration: Duration(seconds: 3),
                );
              },
              child: Text('info Snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomAnimatedSnackbar.warningSnackbar(
                  context,
                  title: 'Welcome',
                  subTitle: 'This is Warning Snackbar developed by Fahad Aziz',
                  duration: Duration(seconds: 3),
                );
              },
              child: Text('Warning Snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomAnimatedSnackbar.loadingSnackbar(
                  context,
                  title: 'Welcome',
                  subTitle: 'This is Loading Snackbar developed by Fahad Aziz',
                  duration: Duration(seconds: 3),
                );
              },
              child: Text('Loading Snackbar'),
            ),
          ],
        ),
      ),
    );
  }
}
