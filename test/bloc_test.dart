import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_redemption_scbtechx/bloc/application/application_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/email/email_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/redemption/redemption_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/splash_load/splash_load_bloc.dart';
import 'package:flutter_redemption_scbtechx/models/product_data_rs.dart';
import 'package:flutter_redemption_scbtechx/models/user_data_rs.dart';
import 'package:flutter_redemption_scbtechx/models/view/user_session_dto.dart';
import 'package:flutter_redemption_scbtechx/ui/view/product_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'core/mock_service.mocks.dart';
import 'resource/fake_response.dart';

final UserSessionDto userTest = UserSessionDto(userDataRs: UserDataRs(customerData: CustomerData(name: 'Somchai Jaidee', pointAmount: 100000, email: 'monika15077@gmail.com')));

ProductDataRs productDataRs = ProductDataRs.fromJson(jsonDecode(fakeResponseProductData));
UserDataRs userDataRs = UserDataRs.fromJson(jsonDecode(fakeResponseUserData));

final Product macbook = Product(name: 'macbook', price: 70000, rateBahtPerPoint: 4);
final Product iphone = Product(name: 'iphone', price: 40000, rateBahtPerPoint: 6);
final Product ipad = Product(name: 'ipad', price: 30000, rateBahtPerPoint: 5);

void main() {
  late ApplicationBloc applicationBloc;
  late SplashLoadBloc splashLoadBloc;
  late RedemptionBloc redemptionBloc;

  late MockRedemptionService mockRedemptionService;

  setUp(() {
    mockRedemptionService = MockRedemptionService();

    applicationBloc = ApplicationBloc();
    splashLoadBloc = SplashLoadBloc(applicationBloc, mockRedemptionService);
    redemptionBloc = RedemptionBloc(applicationBloc);
  });

  tearDown(
    () {
      applicationBloc.close();
      splashLoadBloc.close();
      redemptionBloc.close();
    },
  );

  group('SplashBloc', () {
    blocTest<SplashLoadBloc, SplashLoadState>(
      'load init data',
      build: () => splashLoadBloc,
      setUp: () {
        when(mockRedemptionService.getUserData()).thenAnswer((_) async => userDataRs);
        when(mockRedemptionService.getProductData()).thenAnswer((_) async => productDataRs);
      },
      act: (bloc) => bloc.add(SplashLoadInitEvent()),
      wait: const Duration(seconds: 5),
      expect: () => [
        isA<LoadingSplashLoadInitState>(),
        isA<SuccessSplashLoadInitState>(),
      ],
    );
  });

  group('ApplicationBloc', () {
    blocTest<ApplicationBloc, ApplicationState>(
      'set data expect same data only',
      build: () => applicationBloc,
      act: (bloc) => bloc.add(ApplicationUpdateStateModelEvent(userSession: userTest)),
      expect: () => [
        ApplicationState(userSession: userTest),
      ],
    );
  });

  group('RedemptionBloc', () {
    blocTest<RedemptionBloc, RedemptionState>(
      'sort data by price [low > high]',
      setUp: () {
        applicationBloc.add(ApplicationUpdateStateModelEvent(masterProducts: [iphone, macbook, ipad]));
      },
      build: () => redemptionBloc,
      act: (bloc) => bloc.add(SortDataEvent(sortMode: Sort.price)),
      expect: () => [
        isA<LoadingRedemptionState>(),
        SuccessSortDataState(products: [ipad, iphone, macbook]),
      ],
    );

    blocTest<RedemptionBloc, RedemptionState>(
      'sort data by rate [low > high]',
      setUp: () {
        applicationBloc.add(ApplicationUpdateStateModelEvent(masterProducts: [iphone, macbook, ipad]));
      },
      build: () => redemptionBloc,
      act: (bloc) => bloc.add(SortDataEvent(sortMode: Sort.rate)),
      expect: () => [
        isA<LoadingRedemptionState>(),
        SuccessSortDataState(products: [macbook, ipad, iphone]),
      ],
    );

    blocTest<RedemptionBloc, RedemptionState>(
      'use redemption 300 point',
      setUp: () {
        applicationBloc.add(ApplicationUpdateStateModelEvent(
          userSession: userTest,
        ));
      },
      build: () => redemptionBloc,
      act: (bloc) => [
        bloc.add(RedemptionPointEvent(pointUsed: 100)),
        bloc.add(RedemptionPointEvent(pointUsed: 100)),
        bloc.add(RedemptionPointEvent(pointUsed: 100)),
      ],
      skip: 2,
      expect: () => [
        SuccessRedemptionPointState(useRedemptionAmt: 300),
      ],
    );
  });
}
