import 'package:flutter/material.dart';
import 'package:projecte_flutter/ui/acceso/ui/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projecte Flutter',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(190, 150, 82, 1),
          onPrimary: Color.fromRGBO(255, 255, 255, 1),
          secondary: Color.fromRGBO(54, 76, 92, 1),
          surface: Color.fromRGBO(255, 255, 255, 1),
          onSurface: Color.fromRGBO(43, 47, 50, 1),
          outline: Color.fromRGBO(218, 215, 205, 1),
        ),
        scaffoldBackgroundColor: Color.fromRGBO(246, 243, 236, 1),
      ),
      home: const LoginScreen(),
    );
  }
}
