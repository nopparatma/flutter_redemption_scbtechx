import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/redemption/redemption_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/redemption/redemption_bloc.dart';

import '../../bloc/application/application_bloc.dart';
import '../../models/product_data_rs.dart';
import '../router.dart';
import '../widget/custom_button.dart';
import '../widget/summary_panel.dart';

class RedemptionPage extends StatefulWidget {
  final Product productItem;

  const RedemptionPage({super.key, required this.productItem});

  @override
  State<RedemptionPage> createState() => _RedemptionPageState();
}

class _RedemptionPageState extends State<RedemptionPage> {
  num get pointUsed => BlocProvider.of<ApplicationBloc>(context).state.calPointUsed(widget.productItem.price ?? 0, widget.productItem.rateBahtPerPoint ?? 0);

  num get pointBalance => BlocProvider.of<ApplicationBloc>(context).state.tempRemainPointAmt(pointUsed);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RedemptionBloc, RedemptionState>(
      listener: (context, state) {
        if (state is SuccessRedemptionPointState) {
          Navigator.of(context).pushNamed(RoutePaths.successPage, arguments: {'productItem': widget.productItem});
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SummaryPanel(productItem: widget.productItem, pointUsed: pointUsed, pointBalance: pointBalance),
            CustomButton(
              text: 'Redeem',
              color: Colors.green,
              onPressed: () {
                context.read<RedemptionBloc>().add(RedemptionPointEvent(pointUsed: pointUsed));
              },
            ),
          ],
        ),
      ),
    );
  }
}
