



import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TypewriterAnimatedWidget extends StatefulWidget {
  const TypewriterAnimatedWidget({ Key? key ,@required this.contentText}) : super(key: key);
  final String? contentText;

  @override
  State<TypewriterAnimatedWidget> createState() => _TypewriterAnimatedWidgetState();
}

class _TypewriterAnimatedWidgetState extends State<TypewriterAnimatedWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 100,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                widget.contentText!,
                textStyle: const TextStyle(
                  fontSize: 42,
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                ),
                speed: const Duration(milliseconds: 200),
              ),
            ],
            repeatForever: true,
            pause: const Duration(milliseconds: 100),
            displayFullTextOnTap: true,
            stopPauseOnTap: false,
          ),
        );
  }
}
