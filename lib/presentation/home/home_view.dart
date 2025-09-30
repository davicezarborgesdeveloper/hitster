import 'package:flutter/material.dart';
import 'package:hitster/presentation/share/widgets/background_gradient.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          BackgroundGradient(
              colorFst: Color(0XFF2CCBF5), colorSnd: Color(0XFF624595)),
        ],
      ),
    );
  }
}
