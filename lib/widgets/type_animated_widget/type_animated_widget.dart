



import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TypewriterAnimatedWidget extends StatefulWidget {
  const TypewriterAnimatedWidget({ Key? key ,@required this.titleSize,@required this.contentText, @required this.textAlign}) : super(key: key);
  final TextAlign? textAlign;
  final String? contentText;
  final double? titleSize;

  @override
  State<TypewriterAnimatedWidget> createState() => _TypewriterAnimatedWidgetState();
}

class _TypewriterAnimatedWidgetState extends State<TypewriterAnimatedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: SizedBox(
            height: widget.titleSize!*2.6,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  widget.contentText!,
                  textStyle:  TextStyle(
                    fontSize: widget.titleSize!,
                    height: 1.2,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: widget.textAlign!,
                  speed: const Duration(milliseconds: 200),
                ),
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: false,
            ),
          ),
    );
  }
}
