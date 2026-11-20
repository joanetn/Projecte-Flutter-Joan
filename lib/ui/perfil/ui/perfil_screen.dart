import 'package:flutter/material.dart';

import '../../core/ui/button.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({
    super.key,
    required this.onCerrarSesion,
    required this.modoOscuro,
    required this.escalaTexto,
    required this.onPreferenciasActualizadas,
  });

  final VoidCallback onCerrarSesion;
  final bool modoOscuro;
  final double escalaTexto;
  final void Function(bool modoOscuro, double escalaTexto)
      onPreferenciasActualizadas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      appBar: AppBar(
        title: const Text('Perfil y ajustes'),
        backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 42,
            backgroundColor: Color.fromRGBO(54, 76, 92, 1),
            child: Icon(Icons.person_outline, color: Colors.white, size: 44),
          ),
          const SizedBox(height: 12),
          const Text(
            'Usuario Demo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(35, 51, 62, 1),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'demo@espacios.local',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromRGBO(105, 111, 113, 1)),
          ),
          const SizedBox(height: 24),
          Card(
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.notifications_none),
                  title: Text('Notificaciones'),
                  value: true,
                  onChanged: (_) {},
                ),
                SwitchListTile(
                  secondary: const Icon(Icons.dark_mode_outlined),
                  title: const Text('Modo oscuro'),
                  subtitle: const Text('Cambia el contraste de la aplicación'),
                  value: modoOscuro,
                  onChanged: (valor) {
                    onPreferenciasActualizadas(valor, escalaTexto);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.text_fields),
                  title: const Text('Tamaño de letra'),
                  subtitle: Text(_textoEscala(escalaTexto)),
                ),
                Slider(
                  value: escalaTexto,
                  min: 0.9,
                  max: 1.3,
                  divisions: 4,
                  label: _textoEscala(escalaTexto),
                  onChanged: (valor) {
                    onPreferenciasActualizadas(modoOscuro, valor);
                  },
                ),
                const ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Idioma'),
                  subtitle: Text('Español'),
                ),
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Sobre la aplicación'),
                  subtitle: Text('Demo de espacios y reservas simuladas'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Boton(
            texto: 'Cerrar sesión',
            tipo: TipoBoton.secundario,
            colorTexto: const Color.fromRGBO(157, 119, 78, 1),
            colorFondo: const Color.fromRGBO(157, 119, 78, 1),
            icono: Icons.logout,
            ancho: double.infinity,
            onPressed: onCerrarSesion,
          ),
        ],
      ),
    );
  }

  String _textoEscala(double escala) {
    if (escala < 1) {
      return 'Pequeña';
    }
    if (escala > 1) {
      return 'Grande';
    }
    return 'Normal';
  }
}
