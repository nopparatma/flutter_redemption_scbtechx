import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../router.dart';
import '../widget/custom_button.dart';
import '../widget/summary_panel.dart';

class RedemptionPage extends StatefulWidget {
  const RedemptionPage({super.key});

  @override
  State<RedemptionPage> createState() => _RedemptionPageState();
}

class _RedemptionPageState extends State<RedemptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SummaryPanel(),
          CustomButton(
            text: 'Redeem',
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).pushNamed(RoutePaths.successPage);
            },
          ),
        ],
      ),
    );
  }
}
