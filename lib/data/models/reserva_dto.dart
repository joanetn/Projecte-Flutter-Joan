class ReservaDto {
  const ReservaDto({
    required this.id,
    required this.espacioId,
    required this.usuarioId,
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
  final String espacioId;
  final String usuarioId;
  final String actividad;
  final DateTime inicio;
  final DateTime fin;
  final int asistentes;
  final String estado;
  final List<String> servicios;
  final int precioTotalCentimos;
  final String moneda;
}
