import 'package:flutter/material.dart';

import '../resource/color_manager.dart';
import '../share/widgets/scaffold_hitster.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldHitster(
      colorFst: ColorManager.ternary,
      colorSnd: ColorManager.ternaryLight,
      bubbles: 3,
      sndRoute: '/close',
      child: Column(
        children: [],
      ),
    );
  }
}
