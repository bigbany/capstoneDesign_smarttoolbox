import 'package:flutter/material.dart';
import '../../main.dart';

import '../../widgets/call_to_action/call_to_action.dart';
import '../../widgets/centered_view/centered_view.dart';
import '../../widgets/course_details/course_details.dart';
import '../../widgets/navigation_bar/navigation_bar.dart' as nb;

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
          child: Column(
        children: <Widget>[
          nb.NavigationBar(),
          Expanded(
              child: Row(
            children: [
              CourseDetails(),
              Expanded(
                  child: Center(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CallToAction('회원가입하기'),
                ],
              )))
            ],
          ))
        ],
      )),
    );
  }
}
