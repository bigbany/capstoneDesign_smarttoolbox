import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smarttoolbox/widgets/type_animated_widget/type_animated_widget.dart';

class CourseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? TextAlign.left
              : TextAlign.center;

      double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 50
              : sizingInformation.deviceScreenType ==DeviceScreenType.desktop ? 80:
              70
              ;
      double descriptionSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 16
              : 21;
      return Container(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TypewriterAnimatedWidget(
                contentText: '공구관리 시스템 \n새롭게',
                textAlign: textAlignment,
                titleSize: titleSize,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'NFC 태그를 이용한 공구 추적 \n'
                '관리자로서 손쉽게 시작하세요.',
                style: TextStyle(fontSize: descriptionSize, height: 1.7),
                textAlign: textAlignment,
              ),
            ],
          ));
    });
  }
}
