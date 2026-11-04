import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scube/main.dart';
import 'package:scube/screens/login_screen.dart';
import 'package:scube/screens/splash_screen.dart';

void main() {
  // A phone-sized screen so layouts render as they do on a device.
  void usePhoneSize(WidgetTester tester) {
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
  }

  testWidgets('app opens on the splash screen, then moves to login', (tester) async {
    usePhoneSize(tester);
    await tester.pumpWidget(const MyApp());

    expect(find.byType(SplashScreen), findsOneWidget);

    // The splash screen navigates to /login after 3 seconds.
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('login screen shows branding and the login form', (tester) async {
    usePhoneSize(tester);
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    // The login card slides in after a 500 ms delay.
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pumpAndSettle();

    expect(find.text('SCUBE'), findsOneWidget);
    expect(find.text('Control & Monitoring System'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });

  testWidgets('forgot password shows a coming-soon message', (tester) async {
    usePhoneSize(tester);
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    // The login card slides in after a 500 ms delay.
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Forgot password?'));
    await tester.pump();

    expect(find.text('Forgot password feature coming soon'), findsOneWidget);
  });
}
