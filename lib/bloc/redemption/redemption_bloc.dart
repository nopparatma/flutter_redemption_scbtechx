import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_redemption_scbtechx/models/view/user_session_dto.dart';
import 'package:flutter_redemption_scbtechx/ui/view/product_list_page.dart';
import 'package:flutter_redemption_scbtechx/utillties/math_util.dart';
import 'package:meta/meta.dart';

import '../../models/product_data_rs.dart';
import '../../models/user_data_rs.dart';
import '../../services/redemption_service.dart';
import '../application/application_bloc.dart';

part 'redemption_event.dart';

part 'redemption_state.dart';

class RedemptionBloc extends Bloc<RedemptionEvent, RedemptionState> {
  final ApplicationBloc applicationBloc;

  RedemptionBloc(this.applicationBloc) : super(InitialRedemptionState()) {
    // Sort
    on<SortDataEvent>((event, emit) => mapSortDataEventToState(event, emit));
    // Redemption
    on<RedemptionPointEvent>((event, emit) => mapRedemptionPointEventToState(event, emit));
  }

  Future<void> mapSortDataEventToState(SortDataEvent event, Emitter<RedemptionState> emit) async {
    emit(LoadingRedemptionState());

    List<Product>? listDisPlay = applicationBloc.state.masterProducts;

    if (Sort.price == event.sortMode) {
      listDisPlay?.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
    } else if (Sort.rate == event.sortMode) {
      listDisPlay?.sort((a, b) => (a.rateBahtPerPoint ?? 0).compareTo(b.rateBahtPerPoint ?? 0));
    }

    emit(SuccessSortDataState(products: listDisPlay));
  }

  Future<void> mapRedemptionPointEventToState(RedemptionPointEvent event, Emitter<RedemptionState> emit) async {
    UserSessionDto? userSessionDto = applicationBloc.state.userSession;
    userSessionDto?.useRedemptionAmt = MathUtil.add(userSessionDto.useRedemptionAmt, event.pointUsed);

    applicationBloc.add(
      ApplicationUpdateStateModelEvent(
        userSession: userSessionDto,
      ),
    );

    emit(SuccessRedemptionPointState(useRedemptionAmt: userSessionDto?.useRedemptionAmt ?? 0));
  }
}
