import 'package:flutter/material.dart';
import 'package:projecte_flutter/ui/acceso/ui/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _modoOscuro = false;
  double _escalaTexto = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projecte Flutter',
      theme: _crearTema(
        _modoOscuro ? Brightness.dark : Brightness.light,
      ),
      home: LoginScreen(
        modoOscuro: _modoOscuro,
        escalaTexto: _escalaTexto,
        onPreferenciasActualizadas: (modoOscuro, escalaTexto) {
          setState(() {
            _modoOscuro = modoOscuro;
            _escalaTexto = escalaTexto;
          });
        },
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(_escalaTexto),
          ),
          child: child!,
        );
      },
    );
  }

  ThemeData _crearTema(Brightness brillo) {
    final oscuro = brillo == Brightness.dark;
    return ThemeData(
      brightness: brillo,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      colorScheme: ColorScheme(
        brightness: brillo,
        primary: const Color.fromRGBO(190, 150, 82, 1),
        onPrimary: oscuro ? Colors.black : Colors.white,
        secondary: const Color.fromRGBO(54, 76, 92, 1),
        onSecondary: Colors.white,
        surface: oscuro
            ? const Color.fromRGBO(50, 55, 58, 1)
            : const Color.fromRGBO(255, 255, 255, 1),
        onSurface: oscuro ? Colors.white : const Color.fromRGBO(43, 47, 50, 1),
        error: const Color.fromRGBO(157, 119, 78, 1),
        onError: Colors.white,
        outline: const Color.fromRGBO(218, 215, 205, 1),
      ),
      scaffoldBackgroundColor: oscuro
          ? const Color.fromRGBO(32, 36, 38, 1)
          : const Color.fromRGBO(246, 243, 236, 1),
      canvasColor: oscuro
          ? const Color.fromRGBO(32, 36, 38, 1)
          : const Color.fromRGBO(246, 243, 236, 1),
      cardColor: oscuro
          ? const Color.fromRGBO(50, 55, 58, 1)
          : const Color.fromRGBO(255, 255, 255, 1),
      checkboxTheme: const CheckboxThemeData(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
    );
  }
}
