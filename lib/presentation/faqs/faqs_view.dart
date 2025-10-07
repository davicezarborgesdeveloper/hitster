import 'package:flutter/material.dart';
import '../../domain/enum/flow_state.dart';
import '../resource/assets_manager.dart';
import '../resource/color_manager.dart';
import '../resource/screen_manager.dart';

import '../../app/di.dart';
import '../resource/style_manager.dart';
import '../resource/value_manager.dart';
import '../share/widgets/empty_container.dart';
import 'faqs_viewmodel.dart';
import 'widgets/faq_tile.dart';

class FaqsView extends StatefulWidget {
  const FaqsView({super.key});

  @override
  State<FaqsView> createState() => _FaqsViewState();
}

class _FaqsViewState extends State<FaqsView> {
  final FaqsViewModel _viewModel = instance<FaqsViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  void _bind() {
    _viewModel.start();
  }

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
          child: Image.asset(ImageAssets.logoSplash),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppPadding.p22,
          AppPadding.p16,
          AppPadding.p22,
          AppPadding.zero,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p46),
              child: Text(
                'FAQ (FREQUENTLY ASKED QUESTIONS - PERGUNTAS MAIS FREQUENTES)',
                textAlign: TextAlign.center,
                style:
                    getBoldStyle(color: Colors.white, fontSize: FontSize.s32),
              ),
            ),
            Expanded(
              child: ListenableBuilder(
                listenable:
                    Listenable.merge([_viewModel.state, _viewModel.faqs]),
                builder: (BuildContext context, Widget? child) {
                  return switch (_viewModel.state.value) {
                    FlowState.loading => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    FlowState.success => ListView.builder(
                        itemCount: _viewModel.faqCount,
                        itemBuilder: (context, index) {
                          return FaqTile(faq: _viewModel.faqs.value?[index]);
                        },
                      ),
                    _ => const EmptyContainer()
                  };
                },
              ),
            ),
            // Text('FAQ SOBRE O JOGO'),
            // ExpansionTile(
            //   title: Text(
            //     'COMO EU TOCO AS MÚSICAS?',
            //     style: getBoldStyle(color: Colors.white),
            //   ),
            //   children: [
            //     ListTile(
            //       title: Text('text'),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
