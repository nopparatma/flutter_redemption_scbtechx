import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_redemption_scbtechx/models/send_email_rq.dart';
import 'package:flutter_redemption_scbtechx/services/email_service.dart';
import 'package:meta/meta.dart';

import '../../models/product_data_rs.dart';
import '../../models/user_data_rs.dart';
import '../../utillties/string_util.dart';
import '../application/application_bloc.dart';

part 'email_event.dart';

part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailService _emailService = EmailService();
  final ApplicationBloc applicationBloc;

  EmailBloc(this.applicationBloc) : super(InitialEmailState()) {
    on<SendEmailEvent>((event, emit) => mapSendEmailEventToState(event, emit));
  }

  Future<void> mapSendEmailEventToState(SendEmailEvent event, Emitter<EmailState> emit) async {
    emit(LoadingSendEmailState());

    CustomerData? cust = applicationBloc.state.userSession?.userDataRs?.customerData;
    num pointUsed = applicationBloc.state.calPointUsed(event.productItem.price ?? 0, event.productItem.rateBahtPerPoint ?? 0);
    num remainPointAmt = applicationBloc.state.remainPointAmt();

    SendEmailRq sendEmailRq = SendEmailRq()
      ..serviceId = 'service_6dypi3s'
      ..templateId = 'template_mfleaso'
      ..userId = 'vFR0xD_bGNQZ_KBqD'
      ..accessToken = 'iAopJio9lT66dBTZ_UI3I'
      ..templateParams = TemplateParams(
        toName: cust?.name ?? '',
        userEmail: cust?.email ?? '',
        productName: event.productItem.name,
        productPrice: '${StringUtil.getDisplayNumber(event.productItem.price ?? 0)} Baht',
        productRate: '${StringUtil.getDisplayNumber(event.productItem.rateBahtPerPoint ?? 0)} Baht / 1 Point',
        totalPoint: '${StringUtil.getDisplayNumber(pointUsed)} Point',
        pointBalance: '${StringUtil.getDisplayNumber(remainPointAmt)} Point',
      );

    try {
      await _emailService.sendEmail(sendEmailRq);
    } catch (e) {
      emit(ErrorSendEmailState());
      return;
    }

    emit(SuccessSendEmailState());
  }
}
