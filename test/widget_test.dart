import 'dart:convert';
import 'dart:io';

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
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

  ProductDataRs productDataRs = ProductDataRs.fromJson(jsonDecode(fakeResponseProductData));
  UserDataRs userDataRs = UserDataRs.fromJson(jsonDecode(fakeResponseUserData));

  setUp(() {
    HttpOverrides.global = null;

    mockRedemptionService = MockRedemptionService();
    mockEmailService = MockEmailService();

    applicationBloc = ApplicationBloc();
    splashLoadBloc = SplashLoadBloc(applicationBloc, mockRedemptionService);
    redemptionBloc = RedemptionBloc(applicationBloc);
    emailBloc = EmailBloc(applicationBloc, mockEmailService);

    when(mockRedemptionService.getUserData()).thenAnswer((_) async => userDataRs);
    when(mockRedemptionService.getProductData()).thenAnswer((_) async => productDataRs);
  });

  tearDown(() {
    splashLoadBloc.close();
    applicationBloc.close();
    redemptionBloc.close();
    emailBloc.close();
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
      child: MaterialApp(
        title: 'Flutter Redemption',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        onGenerateRoute: MobileRouter.generateRoute,
        home: SplashPage(splashLoadBloc: splashLoadBloc),
      ),
    );
  }

  testWidgets('SplashPage first view', (WidgetTester tester) async {
    await tester.pumpWidget(createWidget());
    await tester.pump();

    expect(find.byType(SplashPage), findsOneWidget);
    expect(find.byType(ProductListPage), findsNothing);

    // pump จนกว่า Animate ในหน้านั้นจะทำเสร็จ
    await tester.pumpAndSettle();

    expect(find.byType(SplashPage), findsNothing);
    expect(find.byType(ProductListPage), findsOneWidget);
  });

  testWidgets('Count all item must be equal data from API', (WidgetTester tester) async {
    await tester.pumpWidget(createWidget());
    await tester.pumpAndSettle();

    expect(find.byType(Card), findsNWidgets(productDataRs.product?.length ?? 0));
  });

  testWidgets('Tap item to change page to ProductDetailPage', (WidgetTester tester) async {
    await tester.pumpWidget(createWidget());
    await tester.pumpAndSettle();

    expect(find.byType(ProductListPage), findsOneWidget);
    expect(find.byType(ProductDetailPage), findsNothing);

    await tester.tap(find.byType(Card).first);
    await tester.pumpAndSettle();

    expect(find.byType(ProductListPage), findsNothing);
    expect(find.byType(ProductDetailPage), findsOneWidget);
  });
}
