import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.website,
  }) : super(key: key);
  final Widget mobile;
  final Widget? tablet;
  final Widget? website;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= websiteWidth) {
          return website ?? mobile;
        } else if (constraints.maxWidth >= tabletWidth) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
