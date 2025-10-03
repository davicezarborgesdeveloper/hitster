import 'package:flutter/material.dart';

import '../../../domain/model/faqs.dart';
import '../../resource/style_manager.dart';
import '../../resource/value_manager.dart';
import '../../share/widgets/empty_container.dart';
import 'session_tile.dart';

class FaqTile extends StatelessWidget {
  final Faq? faq;
  const FaqTile({required this.faq, super.key});

  @override
  Widget build(BuildContext context) {
    return faq != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
                child: Text(
                  faq!.title ?? '',
                  style:
                      getBoldStyle(color: Colors.white, fontSize: FontSize.s20),
                ),
              ),
              Column(
                children: faq!.session!
                    .map(
                      (s) => SessionTile(s),
                    )
                    .toList(),
              ),
            ],
          )
        : const EmptyContainer();
  }
}
// return ExpansionTile(
                            // title: Text(
                            //   faq.title ?? '',
                            //   style: getBoldStyle(
                            //     color: Colors.white,
                            //     fontSize: FontSize.s20,
                            //   ),
                            // ),
                          //   children: faq.session
                          //           ?.map((f) => Text(f.title ?? ''))
                          //           .toList() ??
                          //       [const EmptyContainer()],
                          // );