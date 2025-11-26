import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/main.dart';

void main() {
  testWidgets('App loads dashboard shell', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: PersonalFinanceCoachApp()));
    await tester.pumpAndSettle();

    expect(find.text('Kişisel Finans Koçu'), findsOneWidget);
  });
}
