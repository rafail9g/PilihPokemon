import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Pokemon lobby UI test', (WidgetTester tester) async {
    await tester.pumpWidget(const PokemonApp());

    // tunggu render selesai
    await tester.pumpAndSettle();

    expect(find.text('Rafail'), findsOneWidget);
    expect(find.text('Level 25'), findsOneWidget);

    expect(find.text('Pikachu'), findsOneWidget);
    expect(find.text('Electric Type'), findsOneWidget);

    expect(find.text('Battle'), findsOneWidget);
    expect(find.text('Inventory'), findsOneWidget);
    expect(find.text('Shop'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });
}