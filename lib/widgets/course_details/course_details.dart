import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:smarttoolbox/widgets/type_animated_widget/type_animated_widget.dart';

class CourseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(
          //   '공구관리 시스템.\n 새롭게',
          //   style: TextStyle(
          //       fontWeight: FontWeight.w800, height: 1.2, fontSize: 80),
          // ),
         TypewriterAnimatedWidget(contentText: '공구관리 시스템 \n새롭게', ),
          SizedBox(
            height: 30,
          ),
          Text(
            'NFC 태그를 이용한 공구 추적 \n'
            '관리자로서 손쉽게 공구 관리하세요.',
            style: TextStyle(fontSize: 21, height: 1.7),
          )
        ],
      ),
    );
  }


}