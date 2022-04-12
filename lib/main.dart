import 'package:flutter/material.dart';
import 'package:smarttoolbox/views/signup/sign_up_view.dart';
import 'views/home/home_view.dart';
import 'widgets/navigation_bar/navigation_bar.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!);
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'OpenSans')),
       
    
      home:    HomeView(),

      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=> HomeView(), transition: Transition.noTransition),
        GetPage(name: "/signup", page: ()=>SignUpView(),
          transition: Transition.noTransition),
      ],
      
    );
  }
}
