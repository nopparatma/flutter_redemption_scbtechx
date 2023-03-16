import 'package:flutter/material.dart';

import '../router.dart';
import '../widget/custom_button.dart';
import '../widget/summary_panel.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('Success !!'),
              ),
              const SummaryPanel(),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Send email',
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      text: 'Go to product list',
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, RoutePaths.productListPage, (route) => false);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
