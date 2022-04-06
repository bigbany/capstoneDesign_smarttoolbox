import 'package:flutter/material.dart';


class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

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
                _NavBarItem('Episodes'),
                SizedBox(
                  width: 60,
                ),
                _NavBarItem('About'),
              ],
            )
          ],
        ));
  }
}



class _NavBarItem extends StatelessWidget {
  final String title;

  const _NavBarItem(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
