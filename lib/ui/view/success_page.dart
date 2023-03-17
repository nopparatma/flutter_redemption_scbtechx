import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/email/email_bloc.dart';
import 'package:flutter_redemption_scbtechx/ui/shared/theme.dart';

import '../../bloc/application/application_bloc.dart';
import '../../models/product_data_rs.dart';
import '../../utillties/dialog_util.dart';
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
  late EmailBloc emailBloc;

  num get pointUsed => BlocProvider.of<ApplicationBloc>(context).state.calPointUsed(widget.productItem.price ?? 0, widget.productItem.rateBahtPerPoint ?? 0);

  num get remainPointAmt => BlocProvider.of<ApplicationBloc>(context).state.remainPointAmt();

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    emailBloc.close();
    super.dispose();
  }

  onPressedSendEmail() {
    emailBloc.add(SendEmailEvent(productItem: widget.productItem));
  }

  onPressedBackToHome() {
    Navigator.pushNamedAndRemoveUntil(context, RoutePaths.productListPage, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => emailBloc = EmailBloc(BlocProvider.of<ApplicationBloc>(context)),
      child: BlocListener<EmailBloc, EmailState>(
        listenWhen: (prevState, currentState) {
          if (prevState is LoadingSendEmailState) {
            DialogUtil.hideLoadingDialog(context);
          }
          return true;
        },
        listener: (context, state) {
          if (state is LoadingSendEmailState) {
            DialogUtil.showLoadingDialog(context);
          } else if (state is ErrorSendEmailState) {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              text: 'Can not send email.',
            );
          } else if (state is SuccessSendEmailState) {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              text: 'send email',
            );
          }
        },
        child: WillPopScope(
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
                          onPressed: () => onPressedSendEmail(),
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          text: 'Go to product list',
                          color: Colors.red,
                          onPressed: () => onPressedBackToHome(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
