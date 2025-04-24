import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_validate/home.dart';

void main() {
  group('LoginPage Widget Tests', () {
    testWidgets('Displays email and password fields',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      // Check if text fields exist
      expect(find.byType(TextField), findsNWidgets(2));
    });

    testWidgets('Displays login button', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      // Check if button exists
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Shows error when email is empty', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      // Tap the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Check if error message appears
      expect(find.text('Please enter your email'), findsOneWidget);
    });

    testWidgets('Shows error when password is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      await tester.enterText(
          find.byType(TextField).first, '0000@my.com'); // Enter valid email
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('Displays success message on correct login',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      // Enter valid email and password
      await tester.enterText(find.byType(TextField).first, '0000@my.com');
      await tester.enterText(find.byType(TextField).last, '0000pass');

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('Login successful!'), findsOneWidget);
    });
  });
}
