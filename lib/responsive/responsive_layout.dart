import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key, required this.mobileScreen, required this.desktopScreen});

  final Widget mobileScreen;
  final Widget desktopScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 600) {
          return mobileScreen;
        } else {
          return desktopScreen;
        }
      },
    );
  }
}
