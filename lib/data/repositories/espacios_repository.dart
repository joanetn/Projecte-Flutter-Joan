import '../../domain/models/espacio.dart';
import '../services/espacios_local_service.dart';

class EspaciosRepository {
  EspaciosRepository({required EspaciosLocalService service})
      : _espacios = service
            .leerEspacios()
            .map(
              (espacio) => Espacio(
                id: espacio.id,
                nombre: espacio.nombre,
                descripcion: espacio.descripcion,
                ubicacion: espacio.ubicacion,
                horario: espacio.horario,
                condicionesUso: espacio.condicionesUso,
                aforo: espacio.aforo,
                imagenAsset: espacio.imagenAsset,
                imagenesAssets: List.unmodifiable(espacio.imagenesAssets),
                serviciosDisponibles:
                    List.unmodifiable(espacio.serviciosDisponibles),
                actividades: List.unmodifiable(espacio.actividades),
                equipamiento: List.unmodifiable(espacio.equipamiento),
                disponibilidad: List.unmodifiable(espacio.disponibilidad),
                opiniones: List.unmodifiable(espacio.opiniones),
                precioHoraCentimos: espacio.precioHoraCentimos,
                moneda: espacio.moneda,
              ),
            )
            .toList(growable: false);

  final List<Espacio> _espacios;

  List<Espacio> obtenerTodos() => _espacios;

  Espacio? obtenerPorId(String id) {
    for (final espacio in _espacios) {
      if (espacio.id == id) {
        return espacio;
      }
    }
    return null;
  }
}
