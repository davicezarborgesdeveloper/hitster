import 'package:flutter/material.dart';

import '../../../app/di.dart';
import '../../resource/value_manager.dart';
import 'bubble_blur.dart';

class ScaffoldHitster extends StatefulWidget {
  final Color colorFst;
  final Color colorSnd;
  final int? bubbles;
  final Widget? child;
  final String sndRoute;
  const ScaffoldHitster({
    super.key,
    this.colorFst = Colors.black,
    this.colorSnd = Colors.black,
    required this.sndRoute,
    this.bubbles = 0,
    this.child,
  });

  @override
  State<ScaffoldHitster> createState() => _ScaffoldHitsterState();
}

class _ScaffoldHitsterState extends State<ScaffoldHitster> {
  late double sizeFst;
  late double sizeSnd;
  late double sizeTrd;

  var atrFst = {};
  var atrSnd = {};
  var atrTrd = {};

  @override
  void initState() {
    atrFst = {
      'size': switch (widget.bubbles) {
        2 => AppSize.s250,
        3 => AppSize.s160,
        _ => AppSize.zero,
      },
      'position': []
    };
    atrSnd = {
      'size': switch (widget.bubbles) {
        2 => AppSize.s150,
        3 => AppSize.s80,
        _ => AppSize.zero,
      },
    };

    atrTrd = {
      'size': switch (widget.bubbles) {
        2 => AppSize.zero,
        3 => AppSize.s292,
        _ => AppSize.zero,
      },
    };

    super.initState();
  }

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
              widget.sndRoute == '/close'
                  ? Navigator.pop(context)
                  : Navigator.of(context).pushNamed('/settings');
            },
            icon: Icon(
              widget.sndRoute == '/close'
                  ? Icons.cancel_outlined
                  : Icons.settings_outlined,
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
            size: atrFst['size'] as double,
            color: Colors.white.withOpacity(.5),
            blur: 10,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 85),
            child: BubbleBlur(
              size: atrSnd['size'] as double,
              color: Colors.white.withOpacity(.4),
              blur: 15,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: BubbleBlur(
            size: atrTrd['size'] as double,
            color: Colors.white.withOpacity(.5),
            blur: 10,
          ),
        ),
      ],
    );
  }
}
