import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/application/application_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/email/email_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/redemption/redemption_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/splash_load/splash_load_bloc.dart';
import 'package:flutter_redemption_scbtechx/models/product_data_rs.dart';
import 'package:flutter_redemption_scbtechx/models/user_data_rs.dart';
import 'package:flutter_redemption_scbtechx/services/email_service.dart';
import 'package:flutter_redemption_scbtechx/services/redemption_service.dart';
import 'package:flutter_redemption_scbtechx/ui/router.dart';
import 'package:flutter_redemption_scbtechx/ui/view/product_detail_page.dart';
import 'package:flutter_redemption_scbtechx/ui/view/product_list_page.dart';
import 'package:flutter_redemption_scbtechx/ui/view/splash_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_redemption_scbtechx/main.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'core/mock_service.mocks.dart';
import 'resource/fake_response.dart';

@GenerateMocks([RedemptionService, EmailService])
void main() {
  LiveTestWidgetsFlutterBinding();

  late ApplicationBloc applicationBloc;
  late EmailBloc emailBloc;
  late RedemptionBloc redemptionBloc;
  late SplashLoadBloc splashLoadBloc;

  late MockRedemptionService mockRedemptionService;
  late MockEmailService mockEmailService;

  setUp(() {
    mockRedemptionService = MockRedemptionService();
    mockEmailService = MockEmailService();

    applicationBloc = ApplicationBloc();
    splashLoadBloc = SplashLoadBloc(applicationBloc, mockRedemptionService);
    redemptionBloc = RedemptionBloc(applicationBloc);
    emailBloc = EmailBloc(applicationBloc, mockEmailService);

    when(mockRedemptionService.getUserData()).thenAnswer((_) async => UserDataRs.fromJson(jsonDecode(fakeResponseUserData)));
    when(mockRedemptionService.getProductData()).thenAnswer((_) async => ProductDataRs.fromJson(jsonDecode(fakeResponseProductData)));
  });

  tearDown(() {
    splashLoadBloc.close();
  });

  Widget createWidget() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
          create: (context) => applicationBloc,
        ),
        BlocProvider<RedemptionBloc>(
          create: (context) => redemptionBloc,
        ),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayOpacity: 0.5,
        overlayColor: Colors.black,
        // overlayWidget: buildOverlayLoader(),
        child: MaterialApp(
          title: 'Flutter Redemption',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          onGenerateRoute: MobileRouter.generateRoute,
          home: SplashPage(splashLoadBloc: splashLoadBloc),
        ),
      ),
    );
  }

  testWidgets('SplashPage first view', (WidgetTester tester) async {

    await tester.pumpWidget(createWidget());
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('INIT_SPLASH_PAGE')), findsOneWidget);
    expect(find.byKey(const Key('LOADING_SPLASH')), findsOneWidget);

    await tester.pump(const Duration(seconds: 10));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('INIT_PRODUCT_LIST')), findsOneWidget);
  });
}
