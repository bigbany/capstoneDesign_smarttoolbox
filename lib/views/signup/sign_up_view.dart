import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smarttoolbox/style/style.dart';
import 'package:smarttoolbox/widgets/drawer/navigation_drawer.dart';
import 'package:smarttoolbox/widgets/home_content/home_content_desktop.dart';
import 'package:smarttoolbox/widgets/home_content/home_content_mobile.dart';
import '../../main.dart';

import '../../widgets/call_to_action/call_to_action.dart';
import '../../widgets/centered_view/centered_view.dart';
import '../../widgets/course_details/course_details.dart';
import '../../widgets/navigation_bar/navigation_bar.dart' as nb;

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double leftContainerSize =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? 600
              : 300;

      var rowAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? 2
              : 1;

    var paddingForCenterview =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ?   EdgeInsets.symmetric(horizontal: 70, vertical: 50)
              : sizingInformation.deviceScreenType== DeviceScreenType.tablet?  EdgeInsets.symmetric(horizontal: 60, vertical: 40)
              : EdgeInsets.all( 0)
              ;


      return Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: Container(
          padding: paddingForCenterview,
          child: Column(
            children: <Widget>[
          // nb.NavigationBar(),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   width: 2,
                  //   color: Colors.orange,
                  // ),
                  boxShadow: [
             BoxShadow( color: shadowGray, offset: Offset(4.0, 4.0), blurRadius: 15.0, spreadRadius: 1.0, ), BoxShadow( color: Colors.white, offset: Offset(-4.0, -4.0), blurRadius: 15.0, spreadRadius: 1.0, ),

                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5.0) // POINT

                      ),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1200, minWidth: 800),
                  child: Row(children: [
                    sizingInformation.deviceScreenType ==
                            DeviceScreenType.mobile
                        ? Container()
                        : Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50)),
                              child: Container(
                                height: 600,
                                width: leftContainerSize,
                                color: tossBlue
                              ),
                            ),
                            flex: rowAlignment,
                          ),
                    Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                              topLeft: Radius.circular(
                                  sizingInformation.deviceScreenType ==
                                          DeviceScreenType.mobile
                                      ? 50
                                      : 0),
                              bottomLeft: Radius.circular(
                                  sizingInformation.deviceScreenType ==
                                          DeviceScreenType.mobile
                                      ? 50
                                      : 0)),
                          child: Container(
                            height: 600,
                            color: otherWhite,
                          ),
                        )),
                  ]),
                ),
              ),
              Text('signuppage'),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/');
                },
                child: Text('뒤로가기'),
                style: ElevatedButton.styleFrom(primary: sweetGreen),
              )
            ],
          ))
            ],
          ),
        ),
      );
    });
  }
}
