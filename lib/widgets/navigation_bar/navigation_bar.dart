import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smarttoolbox/widgets/navigation_bar/navbar_item.dart';
import 'package:smarttoolbox/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:smarttoolbox/widgets/navigation_bar/navigation_bar_tabletDesktop.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}
