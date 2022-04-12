import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smarttoolbox/widgets/drawer/navigation_drawer.dart';
import 'package:smarttoolbox/widgets/home_content/home_content_desktop.dart';
import 'package:smarttoolbox/widgets/home_content/home_content_mobile.dart';
import '../../main.dart';

import '../../widgets/call_to_action/call_to_action.dart';
import '../../widgets/centered_view/centered_view.dart';
import '../../widgets/course_details/course_details.dart';
import '../../widgets/navigation_bar/navigation_bar.dart' as nb;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        

      builder: (context, sizingInformation) {
             var paddingForCenterview =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ?   EdgeInsets.symmetric(horizontal: 70, vertical: 50)
              : sizingInformation.deviceScreenType== DeviceScreenType.tablet?  EdgeInsets.symmetric(horizontal: 60, vertical: 40)
              : EdgeInsets.only(top: 10)
              ;


        return Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
            backgroundColor: Colors.white,
            body: Container(
                alignment: Alignment.topCenter,
              padding:  paddingForCenterview,
              child: ConstrainedBox(
                 constraints: BoxConstraints(maxWidth: 1200),
                child: Column(children: <Widget>[
                  nb.NavigationBar(),
                  Expanded(child: ScreenTypeLayout(mobile: HomeContentMobile(), desktop: HomeContentDesktop(),))
                ],),
              ),
            ),
        
      );
      },
    );
  }
}
