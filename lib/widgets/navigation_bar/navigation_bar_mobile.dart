import 'package:flutter/material.dart';
import 'package:smarttoolbox/widgets/navigation_bar/navbar_item.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            ),
            SizedBox(height: 80, width: 150, child: Text('공구관리서비스')),
            
          ],
        ));
  }
}
