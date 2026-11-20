import 'package:flutter/material.dart';

import '../../core/ui/button.dart';
import '../../core/ui/main_shell_screen.dart';
import 'registro_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.modoOscuro = false,
    this.escalaTexto = 1,
    this.onPreferenciasActualizadas,
  });

  final bool modoOscuro;
  final double escalaTexto;
  final void Function(bool modoOscuro, double escalaTexto)?
      onPreferenciasActualizadas;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _ocultarContrasena = true;

  void _entrar() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => MainShellScreen(
            modoOscuro: widget.modoOscuro,
            escalaTexto: widget.escalaTexto,
            onPreferenciasActualizadas:
                widget.onPreferenciasActualizadas ?? (_, _) {},
            onCerrarSesion: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(54, 76, 92, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.meeting_room_outlined,
                  color: Colors.white,
                  size: 42,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Bienvenido',
                style: TextStyle(
                  color: Color.fromRGBO(35, 51, 62, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Accede para descubrir espacios para tus planes.',
                style: TextStyle(color: Color.fromRGBO(105, 111, 113, 1)),
              ),
              const SizedBox(height: 32),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: _decoracion('Correo electrónico', Icons.email_outlined),
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
              const SizedBox(height: 28),
              Boton(
                texto: 'Entrar',
                icono: Icons.arrow_forward,
                ancho: double.infinity,
                onPressed: _entrar,
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿No tienes cuenta?',
                    style: TextStyle(color: Color.fromRGBO(105, 111, 113, 1)),
                  ),
                  Boton(
                    texto: 'Regístrate',
                    tipo: TipoBoton.texto,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const RegistroScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Acceso de demostración: no se comprueban credenciales reales.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(105, 111, 113, 1),
                  fontSize: 12,
                ),
              ),
            ],
          ),
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
