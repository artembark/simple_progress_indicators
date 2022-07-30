import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('Can find ProgressBar text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SimpleProgressIndicatorsApp());

    expect(find.text('ProgressBar'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
