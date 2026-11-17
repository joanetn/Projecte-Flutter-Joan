import 'espacio.dart';
import 'usuario.dart';

enum EstadoReserva { confirmada, pendiente, cancelada }

class Reserva {
  const Reserva({
    required this.id,
    required this.espacio,
    required this.usuario,
    required this.actividad,
    required this.inicio,
    required this.fin,
    required this.asistentes,
    required this.estado,
    required this.servicios,
    required this.precioTotalCentimos,
    required this.moneda,
  });

  final String id;
  final Espacio espacio;
  final Usuario usuario;
  final String actividad;
  final DateTime inicio;
  final DateTime fin;
  final int asistentes;
  final EstadoReserva estado;
  final List<String> servicios;
  final int precioTotalCentimos;
  final String moneda;

  Duration get duracion => fin.difference(inicio);
}
