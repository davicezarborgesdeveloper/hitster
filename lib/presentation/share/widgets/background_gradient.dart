import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  final Color colorFst;
  final Color colorSnd;
  const BackgroundGradient(
      {super.key, required this.colorFst, required this.colorSnd});

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
      ],
    );
  }
}
