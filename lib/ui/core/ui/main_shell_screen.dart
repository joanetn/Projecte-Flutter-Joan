import 'package:flutter/material.dart';

import '../../espacios/ui/espacios_screen.dart';
import '../../perfil/ui/perfil_screen.dart';
import '../../reservas/ui/mis_reservas_screen.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key, required this.onCerrarSesion});

  final VoidCallback onCerrarSesion;

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final pantallas = [
      EspaciosScreen(key: ValueKey(_indice)),
      MisReservasScreen(key: ValueKey(_indice)),
      PerfilScreen(onCerrarSesion: widget.onCerrarSesion),
    ];
    return Scaffold(
      body: pantallas[_indice],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indice,
        onDestinationSelected: (indice) {
          setState(() => _indice = indice);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Principal',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Mis reservas',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
