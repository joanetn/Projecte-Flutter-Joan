import 'package:flutter/material.dart';

import '../../core/ui/button.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _ocultarContrasena = true;
  bool _ocultarConfirmacion = true;

  Future<void> _registrar() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Registro completado'),
          content: const Text(
            'Tu cuenta se ha creado de forma simulada. '
            'No se ha guardado ningún usuario real.',
          ),
          actions: [
            Boton(
              texto: 'Volver al login',
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
        title: const Text('Crear cuenta'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text(
              'Regístrate',
              style: TextStyle(
                color: Color.fromRGBO(35, 51, 62, 1),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Crea una cuenta ficticia para probar la aplicación.',
              style: TextStyle(color: Color.fromRGBO(105, 111, 113, 1)),
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: _decoracion('Nombre', Icons.person_outline),
              validator: _campoObligatorio,
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: _decoracion(
                'Correo electrónico',
                Icons.email_outlined,
              ),
              validator: _campoObligatorio,
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: _ocultarContrasena,
              decoration: _decoracion(
                'Contraseña',
                Icons.lock_outline,
                IconButton(
                  onPressed: () {
                    setState(() {
                      _ocultarContrasena = !_ocultarContrasena;
                    });
                  },
                  icon: Icon(
                    _ocultarContrasena
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              validator: _campoObligatorio,
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: _ocultarConfirmacion,
              decoration: _decoracion(
                'Repite la contraseña',
                Icons.lock_reset_outlined,
                IconButton(
                  onPressed: () {
                    setState(() {
                      _ocultarConfirmacion = !_ocultarConfirmacion;
                    });
                  },
                  icon: Icon(
                    _ocultarConfirmacion
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              validator: _campoObligatorio,
            ),
            const SizedBox(height: 28),
            Boton(
              texto: 'Registrarme',
              icono: Icons.person_add_alt_1,
              ancho: double.infinity,
              onPressed: _registrar,
            ),
            const SizedBox(height: 12),
            Boton(
              texto: 'Ya tengo una cuenta',
              tipo: TipoBoton.texto,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _decoracion(String etiqueta, IconData icono, [Widget? sufijo]) {
    return InputDecoration(
      labelText: etiqueta,
      prefixIcon: Icon(icono),
      suffixIcon: sufijo,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color.fromRGBO(190, 150, 82, 1),
          width: 2,
        ),
      ),
    );
  }

  String? _campoObligatorio(String? valor) {
    return valor == null || valor.trim().isEmpty
        ? 'Este campo es obligatorio'
        : null;
  }
}
