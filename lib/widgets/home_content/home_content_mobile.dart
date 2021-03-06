

import 'package:flutter/material.dart';
import 'package:smarttoolbox/widgets/call_to_action/call_to_action.dart';
import 'package:smarttoolbox/widgets/course_details/course_details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CourseDetails(),
          SizedBox(height: 100,),
          CallToAction('회원가입하기'),
        ],
      ),
    );
  }
}