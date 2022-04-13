import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:smarttoolbox/style/style.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({Key? key}) : super(key: key);

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  final authentication = FirebaseAuth.instance;

  void getCurrentUser() {
    final user = authentication.currentUser;
    try {
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  User? loggedUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text('안녕하세요 ${loggedUser!.email}님! '),
          IconButton(
              onPressed: () {
                authentication.signOut();
                Get.offAllNamed('/');
              },
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: redAccent,
              ))
        ],
      )),
    );
  }
}
