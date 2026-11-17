import '../models/reserva_dto.dart';

class ReservasLocalService {
  List<ReservaDto> leerReservas() => [
        ReservaDto(
          id: 'r1',
          espacioId: 'e1',
          usuarioId: 'u1',
          actividad: 'Reunión de equipo',
          inicio: DateTime(2026, 11, 12, 10),
          fin: DateTime(2026, 11, 12, 12),
          asistentes: 8,
          estado: 'CONF',
          servicios: ['Proyector'],
          precioTotalCentimos: 7100,
          moneda: 'EUR',
        ),
        ReservaDto(
          id: 'r2',
          espacioId: 'e5',
          usuarioId: 'u1',
          actividad: 'Celebración',
          inicio: DateTime(2026, 11, 20, 18),
          fin: DateTime(2026, 11, 20, 21),
          asistentes: 20,
          estado: 'PEND',
          servicios: ['Catering'],
          precioTotalCentimos: 15600,
          moneda: 'EUR',
        ),
      ];
}
