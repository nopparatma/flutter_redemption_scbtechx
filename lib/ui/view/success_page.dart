import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redemption_scbtechx/ui/shared/theme.dart';

import '../../bloc/application/application_bloc.dart';
import '../../models/product_data_rs.dart';
import '../router.dart';
import '../widget/custom_button.dart';
import '../widget/summary_panel.dart';

class SuccessPage extends StatefulWidget {
  final Product productItem;

  const SuccessPage({super.key, required this.productItem});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  num get pointUsed => BlocProvider.of<ApplicationBloc>(context).state.calPointUsed(widget.productItem.price ?? 0, widget.productItem.rateBahtPerPoint ?? 0);

  num get remainPointAmt => BlocProvider.of<ApplicationBloc>(context).state.remainPointAmt();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Success !!',
                  style: Theme.of(context).textTheme.xLarger.copyWith(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
              SummaryPanel(productItem: widget.productItem, pointUsed: pointUsed, pointBalance: remainPointAmt),
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
