import 'package:flutter/material.dart';

import '../../../domain/model/faqs.dart';
import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/style_manager.dart';

class SessionTile extends StatefulWidget {
  final Session s;
  const SessionTile(this.s, {super.key});

  @override
  State<SessionTile> createState() => _SessionTileState();
}

class _SessionTileState extends State<SessionTile> {
  final isOpen = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const Border(),
      trailing: ValueListenableBuilder(
        valueListenable: isOpen,
        builder: (context, isOpen, value) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, anim) =>
              FadeTransition(opacity: anim, child: child),
          child: isOpen
              ? const Icon(Icons.remove_circle_outline)
              : const Icon(Icons.add_circle_outline),
        ),
      ),
      onExpansionChanged: (v) => isOpen.value = v,
      title: ValueListenableBuilder(
        valueListenable: isOpen,
        builder: (context, isOpen, value) => Text(
          widget.s.title ?? '',
          style: getMediumStyle(
            color: isOpen ? ColorManager.primary : Colors.white,
            fontSize: FontSize.s20,
          ),
        ),
      ),
      children: [
        getContent(
          widget.s.content ?? '',
        )
      ],
    );
  }

  Widget getContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        content,
        style: getRegularStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
