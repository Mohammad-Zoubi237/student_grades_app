
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:student_grades_app/main.dart';

void main() {
  testWidgets('Student grades application test', (tester) async {
    await tester.pumpWidget(const GradesApp());

    // Check the initial average and student grade.
    expect(find.text('ממוצע: 66.3'), findsOneWidget);
    expect(find.text('נויה'), findsOneWidget);
    expect(find.text('ציון: 92'), findsOneWidget);

    // Increase the first student's grade.
    await tester.tap(find.byIcon(Icons.add).first);
    await tester.pump();

    // Verify that the grade and average changed.
    expect(find.text('ציון: 93'), findsOneWidget);
    expect(find.text('ממוצע: 66.5'), findsOneWidget);
  });
}
