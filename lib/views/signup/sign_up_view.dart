import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smarttoolbox/style/style.dart';
import 'package:smarttoolbox/widgets/dialog/dialog.dart';
import 'package:smarttoolbox/widgets/drawer/navigation_drawer.dart';
import 'package:smarttoolbox/widgets/home_content/home_content_desktop.dart';
import 'package:smarttoolbox/widgets/home_content/home_content_mobile.dart';
import '../../main.dart';

import '../../widgets/call_to_action/call_to_action.dart';
import '../../widgets/centered_view/centered_view.dart';
import '../../widgets/course_details/course_details.dart';
import '../../widgets/navigation_bar/navigation_bar.dart' as nb;
import 'package:firebase_auth/firebase_auth.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  final authentication = FirebaseAuth.instance;
  // final authentication = FirebaseAuthWeb;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      bool isSignupScreen = true;
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
              ? EdgeInsets.symmetric(horizontal: 70, vertical: 50)
              : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                  ? EdgeInsets.symmetric(horizontal: 60, vertical: 40)
                  : EdgeInsets.only(top: 10);

      int screenMode =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? 3
              : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                  ? 2
                  : 1;

      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: paddingForCenterview,
          child: Center(
            child: Column(
              children: <Widget>[
                // nb.NavigationBar(),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowGray,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                        borderRadius:
                            BorderRadius.all(Radius.circular(5.0) // POINT

                                ),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 1200,
                        ),
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
                                        color: tossBlue),
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
                                  padding: EdgeInsets.all(20),
                                  height: 600,
                                  color: otherWhite,
                                  child: Form(
                                      key: this.formKey,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          renderTextFormField(
                                            label: '이메일',
                                            onSaved: (val) {
                                              setState(() {
                                                this.email = val;
                                                print('이메일은 ${email}');
                                              });
                                            },
                                            validator: (val) {
                                              if (val.length < 1) {
                                                return '이메일은 필수사항입니다.';
                                              }

                                              if (!RegExp(
                                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                                  .hasMatch(val)) {
                                                return '잘못된 이메일 형식입니다.';
                                              }

                                              return null;
                                            },
                                          ),
                                          renderTextFormField(
                                            label: '비밀번호',
                                            onSaved: (val) {
                                              setState(() {
                                                this.password = val;
                                                print('비밀번호는 ${password}');
                                              });
                                            },
                                            validator: (val) {
                                              if (val.length < 1) {
                                                return '비밀번호는 필수사항입니다.';
                                              }

                                              if (val.length < 8) {
                                                return '8자 이상 입력해주세요!';
                                              }
                                              return null;
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              renderButton('로그인'),
                                              SizedBox(
                                                width: screenMode * 10,
                                              ),
                                              renderButton('회원가입')
                                            ],
                                          )
                                        ],
                                      )),
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
        ),
      );
    });
  }

  renderTextFormField({
    @required String? label,
    @required FormFieldSetter? onSaved,
    @required FormFieldValidator? validator,
  }) {
    assert(onSaved != null);
    assert(validator != null);

    return Column(
      children: [
        Row(
          children: [
            Text(
              label!,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
        ),
        Container(height: 16.0),
      ],
    );
  }

  renderButton(String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: title == '로그인' ? sweetGreen : redAccent,
          // maximumSize: Size(200,50),
          minimumSize: Size(100, 50)),
      onPressed: () async {
        if (title == '로그인') {
          if (formKey!.currentState!.validate()) {
            formKey!.currentState!.save();
            try {
              final newUser = await authentication.signInWithEmailAndPassword(
                  email: email, password: password);

              if (newUser.user != null) {
                Get.toNamed('/mainhome');
                Get.snackbar(
                  '성공!',
                  '로그인 되었습니다!',
                  backgroundColor: Colors.white,
                );
              }
            } catch (e) {
              openDialog(message1: '로그인 실패', message2: '계정을 확인해주세요');
              print(e);
            }
            // validation 이 성공하면 true 가 리턴돼요!

          }
        } else {
          if (formKey!.currentState!.validate()) {
            formKey!.currentState!.save();
            try {
              final newUser =
                  await authentication.createUserWithEmailAndPassword(
                      email: email, password: password);

              if (newUser.user != null) {
                Get.toNamed('/mainhome');

                Get.snackbar(
                  '성공',
                  '회원가입이 완료되었습니다!',
                  backgroundColor: Colors.white,
                );
              }
            } catch (e) {
              print(e);

              openDialog(message1: '회원가입 실패', message2: '계정을 확인해주세요');
            }
            // validation 이 성공하면 true 가 리턴돼요!

          }
        }
      },
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
