import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_redemption_scbtechx/main.dart' as app;

const int TIME_DELAY = 100;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  simpleFlow(WidgetTester widgetTester) async {
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));

    await widgetTester.tap(find.byIcon(Icons.keyboard_arrow_down_outlined));
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));

    await widgetTester.tap(find.text('Sort : Price').last);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));

    await widgetTester.tap(find.byIcon(Icons.keyboard_arrow_down_outlined));
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));

    await widgetTester.tap(find.text('Sort : Rate').last);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));

    await widgetTester.tap(find.byType(Card).first);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));

    await widgetTester.tap(find.byIcon(Icons.star).last);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));

    await widgetTester.tap(find.text('Next').last);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));

    await widgetTester.tap(find.text('Redeem').last);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));

    await widgetTester.tap(find.text('Go to product list').last);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));
  }

  testWidgets('simple integration test', (widgetTester) async {
    app.main();

    for (int i = 0; i < 5; i++) {
      await simpleFlow(widgetTester);
    }

    await widgetTester.pump(const Duration(milliseconds: TIME_DELAY));
  });
}
