import 'package:flutter/material.dart';
import 'package:hitster/presentation/resource/assets_manager.dart';
import 'package:hitster/presentation/resource/color_manager.dart';
import 'package:hitster/presentation/resource/screen_manager.dart';

import '../../app/di.dart';
import 'faqs_viewmodel.dart';

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
            child: Image.asset(ImageAssets.logoSplash)),
      ),
      body: Column(
        children: [
          Text('FAQ (FREQUENTLY ASKED QUESTIONS - PERGUMTAS MAIS FREQUENTES)'),
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
    );
  }
}
