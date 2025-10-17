import 'package:flutter/material.dart';

import '../resource/assets_manager.dart';
import '../resource/color_manager.dart';
import '../resource/screen_manager.dart';

class RulesView extends StatelessWidget {
  const RulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorManager.white),
        backgroundColor: ColorManager.black,
        titleSpacing: 0,
        leadingWidth: 40,
        title: SizedBox(
          width: context.percentWidth(.3),
          child: Image.asset(ImageAssets.logoSplash),
        ),
      ),
      body: Container(),
    );
  }
}
