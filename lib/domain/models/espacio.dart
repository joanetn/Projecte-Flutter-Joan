class Espacio {
  const Espacio({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.ubicacion,
    required this.horario,
    required this.condicionesUso,
    required this.aforo,
    required this.imagenAsset,
    required this.imagenesAssets,
    required this.serviciosDisponibles,
    required this.actividades,
    required this.equipamiento,
    required this.disponibilidad,
    required this.opiniones,
    required this.precioHoraCentimos,
    required this.moneda,
  });

  final String id;
  final String nombre;
  final String descripcion;
  final String ubicacion;
  final String horario;
  final String condicionesUso;
  final int aforo;
  final String imagenAsset;
  final List<String> imagenesAssets;
  final List<String> serviciosDisponibles;
  final List<String> actividades;
  final List<String> equipamiento;
  final List<String> disponibilidad;
  final List<String> opiniones;
  final int precioHoraCentimos;
  final String moneda;
}
