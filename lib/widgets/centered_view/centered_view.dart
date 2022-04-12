import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget? child;
  
  const CenteredView({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        // ignore: prefer_const_constructors
        constraints: BoxConstraints(maxWidth: 1200),
        // BoxConstraints 는 Box의 좌우 너비 최대값을 지정한 것.

        child: child,
      ),
    );
  }
}
