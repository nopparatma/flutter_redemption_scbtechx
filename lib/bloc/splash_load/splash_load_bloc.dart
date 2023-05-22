import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product_data_rs.dart';
import '../../models/user_data_rs.dart';
import '../../models/view/user_session_dto.dart';
import '../../services/redemption_service.dart';
import '../application/application_bloc.dart';

part 'splash_load_event.dart';

part 'splash_load_state.dart';

class SplashLoadBloc extends Bloc<SplashLoadEvent, SplashLoadState> {
  final RedemptionService _redemptionService;
  final ApplicationBloc applicationBloc;

  SplashLoadBloc(this.applicationBloc, this._redemptionService) : super(InitialSplashLoadState()) {
    on<SplashLoadInitEvent>((event, emit) => mapSplashLoadInitEventToState(event, emit));
  }

  Future<void> mapSplashLoadInitEventToState(SplashLoadInitEvent event, Emitter<SplashLoadState> emit) async {
    emit(LoadingSplashLoadInitState());

    var futureUserDataRs = _redemptionService.getUserData();
    var futureProductDataRs = _redemptionService.getProductData();

    Future.wait({
      futureUserDataRs,
      futureProductDataRs,
    });

    UserDataRs userDataRs = await futureUserDataRs;
    ProductDataRs productDataRs = await futureProductDataRs;

    applicationBloc.add(
      ApplicationUpdateStateModelEvent(
        userSession: UserSessionDto(userDataRs: userDataRs),
        masterProducts: productDataRs.product,
      ),
    );

    await Future.delayed(const Duration(seconds: 5));

    emit(SuccessSplashLoadInitState());
  }
}
