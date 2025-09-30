import 'package:flutter/material.dart';
import 'package:hitster/presentation/share/widgets/bubble_blur.dart';

class BackgroundGradient extends StatelessWidget {
  final Color colorFst;
  final Color colorSnd;
  final int bubbles;
  const BackgroundGradient(
      {super.key,
      required this.colorFst,
      required this.colorSnd,
      this.bubbles = 0});

  final double sizeFst = 250;
  final double sizeSnd = 150;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [colorFst, colorSnd],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          right: -96,
          top: 254,
          child: BubbleBlur(
            size: sizeFst,
            color: Colors.white.withOpacity(.5),
            blur: 50,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: BubbleBlur(
              size: sizeSnd,
              color: Colors.white,
              blur: 80,
            ),
          ),
        )
      ],
    );
  }
}
