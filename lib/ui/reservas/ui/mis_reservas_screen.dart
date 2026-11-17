import 'package:flutter/material.dart';

import '../../../data/repositories/reservas_repository.dart';
import '../../../data/services/espacios_local_service.dart';
import '../../../data/services/reservas_local_service.dart';
import '../../../data/services/usuarios_local_service.dart';
import '../../../domain/models/reserva.dart';

class MisReservasScreen extends StatelessWidget {
  MisReservasScreen({super.key})
      : _reservas = ReservasRepository(
          reservasService: ReservasLocalService(),
          espaciosService: EspaciosLocalService(),
          usuariosService: UsuariosLocalService(),
        ).obtenerPorUsuario('u1');

  final List<Reserva> _reservas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      appBar: AppBar(
        title: const Text('Mis reservas'),
        backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Tus solicitudes',
            style: TextStyle(
              color: Color.fromRGBO(35, 51, 62, 1),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Datos de demostración, no son reservas reales.',
            style: TextStyle(color: Color.fromRGBO(105, 111, 113, 1)),
          ),
          const SizedBox(height: 20),
          ..._reservas.map((reserva) => _ReservaCard(reserva: reserva)),
        ],
      ),
    );
  }
}

class _ReservaCard extends StatelessWidget {
  const _ReservaCard({required this.reserva});

  final Reserva reserva;

  @override
  Widget build(BuildContext context) {
    final estado = switch (reserva.estado) {
      EstadoReserva.confirmada => 'Confirmada',
      EstadoReserva.pendiente => 'Pendiente',
      EstadoReserva.cancelada => 'Cancelada',
    };
    return Card(
      color: const Color.fromRGBO(255, 255, 255, 1),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    reserva.espacio.nombre,
                    style: const TextStyle(
                      color: Color.fromRGBO(35, 51, 62, 1),
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Chip(
                  label: Text(estado),
                  backgroundColor: const Color.fromRGBO(232, 235, 231, 1),
                ),
              ],
            ),
            Text(reserva.actividad),
            const SizedBox(height: 8),
            Text(
              '${reserva.inicio.day}/${reserva.inicio.month}/${reserva.inicio.year} · '
              '${reserva.inicio.hour}:00 - ${reserva.fin.hour}:00',
            ),
            Text('${reserva.asistentes} asistentes'),
            const SizedBox(height: 8),
            Text(
              '${(reserva.precioTotalCentimos / 100).toStringAsFixed(2)} '
              '${reserva.moneda}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
