import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_redemption_scbtechx/models/product_data_rs.dart';
import 'package:flutter_redemption_scbtechx/models/user_data_rs.dart';
import 'package:flutter_redemption_scbtechx/utillties/math_util.dart';
import 'package:meta/meta.dart';

import '../../models/view/user_session_dto.dart';

part 'application_event.dart';

part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<ApplicationUpdateStateModelEvent>((event, emit) => mapApplicationUpdateStateModelEventToState(event, emit));
  }

  void mapApplicationUpdateStateModelEventToState(ApplicationUpdateStateModelEvent event, Emitter<ApplicationState> emit) {
    emit(
      state.copyWith(
        userSession: event.userSession,
        masterProducts: event.masterProducts,
      ),
    );
  }
}
