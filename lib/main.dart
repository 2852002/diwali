import 'package:flutter/material.dart';
import 'screens/main_page/choose_screen.dart';
import 'screens/auth/splash_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diwali Sale App',
      theme: lightTheme,
      home: SplashScreen(),
      routes: {
        '/choose': (context) => ChooseScreen(),
        // other routes...
      },
    );
  }
}
