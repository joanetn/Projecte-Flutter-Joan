import '../../domain/models/reserva.dart';
import '../../domain/models/servicio_extra.dart';
import '../../domain/models/espacio.dart';
import '../../domain/models/usuario.dart';
import '../models/reserva_dto.dart';
import '../services/espacios_local_service.dart';
import '../services/reservas_local_service.dart';
import '../services/usuarios_local_service.dart';

class ReservasRepository {
  ReservasRepository({
    required ReservasLocalService reservasService,
    required EspaciosLocalService espaciosService,
    required UsuariosLocalService usuariosService,
  }) : _reservas = _convertir(
          reservasService.leerReservas(),
          espaciosService,
          usuariosService,
        );

  final List<Reserva> _reservas;

  List<Reserva> obtenerPorUsuario(String usuarioId) {
    return _reservas.where((reserva) => reserva.usuario.id == usuarioId).toList();
  }

  static List<Reserva> _convertir(
    List<ReservaDto> dtos,
    EspaciosLocalService espaciosService,
    UsuariosLocalService usuariosService,
  ) {
    final espacios = espaciosService.leerEspacios();
    final usuarios = usuariosService.leerUsuarios();
    return dtos.map((dto) {
      final espacioDto = espacios.firstWhere((espacio) => espacio.id == dto.espacioId);
      final usuarioDto = usuarios.firstWhere((usuario) => usuario.id == dto.usuarioId);
      final estado = switch (dto.estado) {
        'CONF' => EstadoReserva.confirmada,
        'CANC' => EstadoReserva.cancelada,
        _ => EstadoReserva.pendiente,
      };
      return Reserva(
        id: dto.id,
        espacio: Espacio(
          id: espacioDto.id,
          nombre: espacioDto.nombre,
          descripcion: espacioDto.descripcion,
          ubicacion: espacioDto.ubicacion,
          horario: espacioDto.horario,
          condicionesUso: espacioDto.condicionesUso,
          aforo: espacioDto.aforo,
          imagenAsset: espacioDto.imagenAsset,
          imagenesAssets: espacioDto.imagenesAssets,
          serviciosDisponibles: espacioDto.serviciosDisponibles
              .map(
                (servicio) => ServicioExtra(
                  id: servicio.id,
                  nombre: servicio.nombre,
                  descripcion: servicio.descripcion,
                  precioCentimos: servicio.precioCentimos,
                ),
              )
              .toList(growable: false),
          actividades: espacioDto.actividades,
          equipamiento: espacioDto.equipamiento,
          disponibilidad: espacioDto.disponibilidad,
          opiniones: espacioDto.opiniones,
          precioHoraCentimos: espacioDto.precioHoraCentimos,
          moneda: espacioDto.moneda,
        ),
        usuario: Usuario(
          id: usuarioDto.id,
          nombre: usuarioDto.nombre,
          correo: usuarioDto.correo,
        ),
        actividad: dto.actividad,
        inicio: dto.inicio,
        fin: dto.fin,
        asistentes: dto.asistentes,
        estado: estado,
        servicios: dto.servicios,
        precioTotalCentimos: dto.precioTotalCentimos,
        moneda: dto.moneda,
      );
    }).toList(growable: false);
  }
}
