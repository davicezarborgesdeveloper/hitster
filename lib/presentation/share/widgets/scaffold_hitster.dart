import 'package:flutter/material.dart';

import '../../../app/di.dart';
import '../../resource/value_manager.dart';
import '../../settings/settings_view.dart';
import 'bubble_blur.dart';

class ScaffoldHitster extends StatefulWidget {
  final Color colorFst;
  final Color colorSnd;
  final int? bubbles;
  final Widget? child;
  const ScaffoldHitster({
    super.key,
    this.colorFst = Colors.black,
    this.colorSnd = Colors.black,
    this.bubbles = 0,
    this.child,
  });

  @override
  State<ScaffoldHitster> createState() => _ScaffoldHitsterState();
}

class _ScaffoldHitsterState extends State<ScaffoldHitster> {
  final double sizeFst = AppSize.s250;
  final double sizeSnd = AppSize.s150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.help_outline,
            color: Colors.white,
            size: 42,
          ),
          onPressed: () {
            initFaqsModule();
            Navigator.of(context).pushNamed('/faq');
          },
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingsView()),
              );
            },
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
          buildBackground(widget.colorFst, widget.colorSnd),
          widget.child != null ? widget.child! : const SizedBox(),
        ],
      ),
    );
  }

  Widget buildBackground(Color colorFst, Color colorSnd) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorFst, colorSnd],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          right: -96,
          top: 235,
          child: BubbleBlur(
            size: sizeFst,
            color: Colors.white.withOpacity(.5),
            blur: 10,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 85),
            child: BubbleBlur(
              size: sizeSnd,
              color: Colors.white.withOpacity(.4),
              blur: 15,
            ),
          ),
        ),
      ],
    );
  }
}
