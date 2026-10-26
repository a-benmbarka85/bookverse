import 'package:flutter_test/flutter_test.dart';

import 'package:bookverse/main.dart';

void main() {
  testWidgets('BookVerse renders book list', (WidgetTester tester) async {
    await tester.pumpWidget(const BookVerseApp());
    await tester.pumpAndSettle();

    expect(find.text('BookVerse'), findsWidgets);
  });
}
