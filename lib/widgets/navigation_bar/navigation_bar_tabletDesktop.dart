import 'package:flutter/material.dart';
import 'package:smarttoolbox/widgets/navigation_bar/navbar_item.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const  NavigationBarTabletDesktop ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 80, width: 150, child: Text('공구관리서비스')),
            Row(
              mainAxisSize: MainAxisSize.min, //use minmum space
              children: <Widget>[
                NavBarItem('Episodes'),
                SizedBox(
                  width: 60,
                ),
                NavBarItem('About'),
              ],
            )
          ],
        ));
  }
}
