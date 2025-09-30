import 'package:flutter/material.dart';
import 'package:hitster/presentation/resource/assets_manager.dart';
import 'package:hitster/presentation/resource/value_manager.dart';
import 'package:hitster/presentation/share/widgets/background_gradient.dart';

import '../resource/style_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: Colors.white,
              size: 42,
            ),
            onPressed: () {}, // ação do ícone novo
            tooltip: 'Ajuda',
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
                size: 42,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            const BackgroundGradient(
                colorFst: Color(0XFF2CCBF5),
                colorSnd: Color(0XFF624595),
                bubbles: 2),
            Column(
              children: [
                Text(
                  'VAMOS JOGAR',
                  style: getMediumStyle(
                      color: Colors.white, fontSize: FontSize.s32),
                ),
                const SizedBox(height: AppPadding.p32),
                Image.asset(ImageAssets.logoSplash),
                const SizedBox(height: AppPadding.p24),
                Text(
                  'O jogo de cartas de música',
                  style: getMediumStyle(
                      color: Colors.white, fontSize: FontSize.s16),
                ),
              ],
            )
          ],
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
