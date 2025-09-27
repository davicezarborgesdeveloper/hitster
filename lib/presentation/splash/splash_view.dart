import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hitster/presentation/resource/screen_manager.dart';
import 'package:hitster/presentation/resource/value_manager.dart';

import '../resource/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final ValueNotifier<bool> _visibleTitle = ValueNotifier(false);
  final ValueNotifier<bool> _visibleSubtitle = ValueNotifier(false);
  final int _duration = 4000;

  void setVisibleTitle() {
    _visibleTitle.value = true;
    Future.delayed(const Duration(milliseconds: 1000), () {
      _visibleSubtitle.value = true;
    });
  }

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  void _goNext() async {
    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (_) => const HomeView()));
  }

  @override
  void initState() {
    super.initState();
    setVisibleTitle();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: _visibleTitle,
                builder: (context, value, child) => AnimatedOpacity(
                  opacity: value ? 1.0 : 0.0,
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: _duration),
                  child: SizedBox(
                    width: context.screenWidth - AppPadding.p46,
                    child: Image.asset(
                      ImageAssets.logoSplash,
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _visibleSubtitle,
                builder: (context, value, child) => AnimatedOpacity(
                  opacity: value ? 1.0 : 0.0,
                  duration: Duration(milliseconds: _duration),
                  child: const Column(
                    children: [
                      SizedBox(height: AppPadding.p24),
                      Text(
                        'The music party game',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.s20,
                            fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
