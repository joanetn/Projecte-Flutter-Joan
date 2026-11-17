import 'package:flutter_test/flutter_test.dart';

import 'package:projecte_flutter/main.dart';

void main() {
  testWidgets('muestra el acceso simulado', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bienvenido'), findsOneWidget);
    expect(
      find.text('Acceso de demostración: no se comprueban credenciales reales.'),
      findsOneWidget,
    );
  });

  testWidgets('permite abrir el registro desde el login', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Regístrate'));
    await tester.pumpAndSettle();

    expect(find.text('Crear cuenta'), findsOneWidget);
    expect(find.text('Repite la contraseña'), findsOneWidget);
  });
}
