import 'package:flutter/material.dart';
import 'package:hitster/presentation/resource/assets_manager.dart';
import 'package:hitster/presentation/resource/color_manager.dart';
import 'package:hitster/presentation/resource/screen_manager.dart';
import 'package:hitster/presentation/resource/style_manager.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorManager.black,
        titleSpacing: 0,
        leadingWidth: 40,
        title: SizedBox(
            width: context.percentWidth(.3),
            child: Image.asset(ImageAssets.logoSplash)),
      ),
      body: Column(
        children: [
          Text('FAQ (FREQUENTLY ASKED QUESTIONS - PERGUMTAS MAIS FREQUENTES)'),
          Text('FAQ SOBRE O JOGO'),
          ExpansionTile(
            title: Text(
              'COMO EU TOCO AS MÚSICAS?',
              style: getBoldStyle(color: Colors.white),
            ),
            children: [
              ListTile(
                title: Text('text'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
