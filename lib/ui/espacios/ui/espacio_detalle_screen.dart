import 'package:flutter/material.dart';

import '../../../domain/models/espacio.dart';
import '../../core/ui/button.dart';

class EspacioDetalleScreen extends StatelessWidget {
  const EspacioDetalleScreen({
    super.key,
    required this.espacio,
  });

  final Espacio espacio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      appBar: AppBar(
        title: Text(espacio.nombre),
        backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Galeria(espacio: espacio),
          const SizedBox(height: 20),
          Text(
            espacio.nombre,
            style: const TextStyle(
              color: Color.fromRGBO(35, 51, 62, 1),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            espacio.descripcion,
            style: const TextStyle(color: Color.fromRGBO(105, 111, 113, 1)),
          ),
          const SizedBox(height: 16),
          _DatosPrincipales(espacio: espacio),
          const SizedBox(height: 20),
          _Seccion(
            titulo: 'Información',
            children: [
              _FilaDato(
                icono: Icons.schedule_outlined,
                titulo: 'Horario',
                valor: espacio.horario,
              ),
              _FilaDato(
                icono: Icons.rule_outlined,
                titulo: 'Condiciones',
                valor: espacio.condicionesUso,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _Seccion(
            titulo: 'Actividades y equipamiento',
            children: [
              _ListaTexto(titulo: 'Actividades', valores: espacio.actividades),
              _ListaTexto(titulo: 'Incluye', valores: espacio.equipamiento),
            ],
          ),
          const SizedBox(height: 20),
          _Seccion(
            titulo: 'Servicios adicionales',
            children: espacio.serviciosDisponibles
                .map(
                  (servicio) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.add_circle_outline,
                      color: Color.fromRGBO(190, 150, 82, 1),
                    ),
                    title: Text(servicio),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          _Seccion(
            titulo: 'Disponibilidad de ejemplo',
            children: espacio.disponibilidad
                .map(
                  (dia) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.calendar_today_outlined,
                      color: Color.fromRGBO(54, 76, 92, 1),
                    ),
                    title: Text(dia),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          _Seccion(
            titulo: 'Opiniones de ejemplo',
            children: espacio.opiniones
                .map(
                  (opinion) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.format_quote_outlined,
                      color: Color.fromRGBO(190, 150, 82, 1),
                    ),
                    title: Text(opinion),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          Boton(
            texto: 'Nueva reserva',
            icono: Icons.calendar_month_outlined,
            ancho: double.infinity,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'La nueva reserva se añadirá en el siguiente paso.',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Galeria extends StatelessWidget {
  const _Galeria({required this.espacio});

  final Espacio espacio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: espacio.imagenesAssets.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          return Container(
            width: 280,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(54, 76, 92, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.image_outlined,
              color: Colors.white,
              size: 52,
            ),
          );
        },
      ),
    );
  }
}

class _DatosPrincipales extends StatelessWidget {
  const _DatosPrincipales({required this.espacio});

  final Espacio espacio;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _DatoPrincipal(
            icono: Icons.location_on_outlined,
            texto: espacio.ubicacion,
          ),
        ),
        Expanded(
          child: _DatoPrincipal(
            icono: Icons.people_outline,
            texto: '${espacio.aforo} personas',
          ),
        ),
        Expanded(
          child: _DatoPrincipal(
            icono: Icons.euro_outlined,
            texto:
                '${(espacio.precioHoraCentimos / 100).toStringAsFixed(2)} / h',
          ),
        ),
      ],
    );
  }
}

class _DatoPrincipal extends StatelessWidget {
  const _DatoPrincipal({required this.icono, required this.texto});

  final IconData icono;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icono, color: const Color.fromRGBO(190, 150, 82, 1)),
        const SizedBox(height: 4),
        Text(
          texto,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class _Seccion extends StatelessWidget {
  const _Seccion({required this.titulo, required this.children});

  final String titulo;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(255, 255, 255, 1),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                color: Color.fromRGBO(35, 51, 62, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _FilaDato extends StatelessWidget {
  const _FilaDato({
    required this.icono,
    required this.titulo,
    required this.valor,
  });

  final IconData icono;
  final String titulo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icono, color: const Color.fromRGBO(54, 76, 92, 1)),
      title: Text(titulo),
      subtitle: Text(valor),
    );
  }
}

class _ListaTexto extends StatelessWidget {
  const _ListaTexto({required this.titulo, required this.valores});

  final String titulo;
  final List<String> valores;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 8,
          children: valores
              .map(
                (valor) => Chip(
                  label: Text(valor),
                  backgroundColor: const Color.fromRGBO(232, 235, 231, 1),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
