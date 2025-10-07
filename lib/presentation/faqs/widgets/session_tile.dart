import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/faqs.dart';
import '../../resource/color_manager.dart';
import '../../resource/style_manager.dart';
import '../../resource/value_manager.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p32),
      child: ExpansionTile(
        shape: const Border(),
        iconColor: ColorManager.primary,
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
          ),
        ],
      ),
    );
  }

  Widget getContent(String content) {
    final regex = RegExp(r'(<a>(.*?)<\/a>|<l>(.*?)<\/l>)');
    final spans = <TextSpan>[];
    int lastIndex = 0;

    for (final match in regex.allMatches(content)) {
      if (match.start > lastIndex) {
        spans.add(
          TextSpan(
            text: content.substring(lastIndex, match.start),
            style: getRegularStyle(color: Colors.white, fontSize: 14),
          ),
        );
      }

      final isExternal = match.group(2) != null;
      final tagContent = isExternal ? match.group(2)! : match.group(3)!;

      spans.add(
        TextSpan(
          text: tagContent,
          style: getRegularStyle(
            color: ColorManager.primary,
            fontSize: 14,
          ).copyWith(decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              if (isExternal) {
                // Tag <a> → abre no navegador/app
                final uri = Uri.parse(tagContent);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              } else {
                // Tag <l> → navegação interna
                if (context.mounted) {
                  Navigator.pushNamed(context, '/form');
                  // ou: Navigator.of(context).push(MaterialPageRoute(builder: (_) => FormPage()));
                }
              }
            },
        ),
      );

      lastIndex = match.end;
    }

    if (lastIndex < content.length) {
      spans.add(
        TextSpan(
          text: content.substring(lastIndex),
          style: getRegularStyle(color: Colors.white, fontSize: 14),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: RichText(text: TextSpan(children: spans)),
    );
  }
}
