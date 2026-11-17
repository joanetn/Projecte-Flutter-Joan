import '../models/espacio_dto.dart';
import '../models/servicio_extra_dto.dart';

class EspaciosLocalService {
  EspaciosLocalService({List<EspacioDto>? espacios})
      : _espacios = List.unmodifiable(espacios ?? _espaciosDemo);

  final List<EspacioDto> _espacios;

  List<EspacioDto> leerEspacios() => _espacios;

  static const _espaciosDemo = [
    EspacioDto(
      id: 'e1',
      nombre: 'Sala Mirador',
      descripcion: 'Sala luminosa para reuniones y talleres pequeños.',
      ubicacion: 'Centro de la ciudad',
      horario: 'Lunes a viernes, de 08:00 a 21:00',
      condicionesUso: 'No se permite fumar. Dejar el espacio recogido.',
      aforo: 12,
      imagenAsset: 'assets/images/sala_mirador.jpg',
      imagenesAssets: [
        'assets/images/sala_mirador.jpg',
        'assets/images/sala_mirador_2.jpg',
        'assets/images/sala_mirador_3.jpg',
      ],
      serviciosDisponibles: [
        ServicioExtraDto(
          id: 'limpieza',
          nombre: 'Limpieza final',
          descripcion: 'Deja el espacio preparado al terminar.',
          precioCentimos: 1500,
        ),
        ServicioExtraDto(
          id: 'proyector',
          nombre: 'Proyector',
          descripcion: 'Proyector y pantalla.',
          precioCentimos: 1200,
        ),
        ServicioExtraDto(
          id: 'catering',
          nombre: 'Catering',
          descripcion: 'Servicio de comida y bebida.',
          precioCentimos: 3500,
        ),
      ],
      actividades: ['Reuniones', 'Talleres', 'Presentaciones'],
      equipamiento: ['Wifi', 'Pizarra', 'Mesas y sillas'],
      disponibilidad: ['Hoy: 10:00 - 18:00', 'Mañana: 08:00 - 21:00'],
      opiniones: ['Espacio cómodo y muy luminoso.', 'Todo estaba preparado.'],
      precioHoraCentimos: 2800,
      moneda: 'EUR',
    ),
    EspacioDto(
      id: 'e2',
      nombre: 'Patio Naranja',
      descripcion: 'Patio exterior tranquilo para celebraciones íntimas.',
      ubicacion: 'Barrio del Mercado',
      horario: 'Todos los días, de 09:00 a 22:00',
      condicionesUso: 'Respetar el horario de descanso de la comunidad.',
      aforo: 30,
      imagenAsset: 'assets/images/patio_naranja.jpg',
      imagenesAssets: [
        'assets/images/patio_naranja.jpg',
        'assets/images/patio_naranja_2.jpg',
      ],
      serviciosDisponibles: [
        ServicioExtraDto(
          id: 'limpieza',
          nombre: 'Limpieza final',
          descripcion: 'Deja el espacio preparado al terminar.',
          precioCentimos: 1500,
        ),
        ServicioExtraDto(
          id: 'iluminacion',
          nombre: 'Iluminación',
          descripcion: 'Iluminación decorativa.',
          precioCentimos: 1800,
        ),
      ],
      actividades: ['Celebraciones', 'Comidas', 'Reuniones'],
      equipamiento: ['Mesas', 'Sillas', 'Iluminación exterior'],
      disponibilidad: ['Hoy: 12:00 - 20:00', 'Mañana: 09:00 - 22:00'],
      opiniones: ['Un patio agradable para grupos.'],
      precioHoraCentimos: 3500,
      moneda: 'EUR',
    ),
    EspacioDto(
      id: 'e3',
      nombre: 'Aula Norte',
      descripcion: 'Aula equipada para cursos, clases y presentaciones.',
      ubicacion: 'Zona universitaria',
      horario: 'Lunes a sábado, de 08:00 a 20:00',
      condicionesUso: 'El material debe devolverse a su sitio.',
      aforo: 25,
      imagenAsset: 'assets/images/aula_norte.jpg',
      imagenesAssets: [
        'assets/images/aula_norte.jpg',
        'assets/images/aula_norte_2.jpg',
      ],
      serviciosDisponibles: [
        ServicioExtraDto(
          id: 'proyector',
          nombre: 'Proyector',
          descripcion: 'Proyector y pantalla.',
          precioCentimos: 1200,
        ),
        ServicioExtraDto(
          id: 'pizarra',
          nombre: 'Pizarra digital',
          descripcion: 'Pizarra digital para presentaciones.',
          precioCentimos: 1000,
        ),
      ],
      actividades: ['Cursos', 'Clases', 'Presentaciones'],
      equipamiento: ['Wifi', 'Proyector', 'Pizarra digital'],
      disponibilidad: ['Hoy: 09:00 - 16:00'],
      opiniones: ['Muy buena aula para formaciones.'],
      precioHoraCentimos: 2200,
      moneda: 'EUR',
    ),
    EspacioDto(
      id: 'e4',
      nombre: 'Estudio Luz',
      descripcion: 'Estudio versátil para sesiones creativas y reuniones.',
      ubicacion: 'Distrito de las Artes',
      horario: 'Lunes a viernes, de 10:00 a 19:00',
      condicionesUso: 'No modificar la instalación de iluminación.',
      aforo: 8,
      imagenAsset: 'assets/images/estudio_luz.jpg',
      imagenesAssets: [
        'assets/images/estudio_luz.jpg',
        'assets/images/estudio_luz_2.jpg',
      ],
      serviciosDisponibles: [
        ServicioExtraDto(
          id: 'sonido',
          nombre: 'Equipo de sonido',
          descripcion: 'Altavoces y micrófono.',
          precioCentimos: 2000,
        ),
        ServicioExtraDto(
          id: 'limpieza',
          nombre: 'Limpieza final',
          descripcion: 'Deja el espacio preparado al terminar.',
          precioCentimos: 1500,
        ),
      ],
      actividades: ['Sesiones creativas', 'Reuniones', 'Fotografía'],
      equipamiento: ['Wifi', 'Iluminación', 'Mesa de trabajo'],
      disponibilidad: ['Mañana: 10:00 - 19:00'],
      opiniones: ['Estudio pequeño pero muy práctico.'],
      precioHoraCentimos: 1900,
      moneda: 'EUR',
    ),
    EspacioDto(
      id: 'e5',
      nombre: 'Terraza Olivo',
      descripcion: 'Terraza amplia con ambiente relajado para eventos.',
      ubicacion: 'Avenida del Parque',
      horario: 'Todos los días, de 10:00 a 23:00',
      condicionesUso: 'La música debe mantenerse a un volumen moderado.',
      aforo: 45,
      imagenAsset: 'assets/images/terraza_olivo.jpg',
      imagenesAssets: [
        'assets/images/terraza_olivo.jpg',
        'assets/images/terraza_olivo_2.jpg',
      ],
      serviciosDisponibles: [
        ServicioExtraDto(
          id: 'catering',
          nombre: 'Catering',
          descripcion: 'Servicio de comida y bebida.',
          precioCentimos: 3500,
        ),
        ServicioExtraDto(
          id: 'iluminacion',
          nombre: 'Iluminación',
          descripcion: 'Iluminación decorativa.',
          precioCentimos: 1800,
        ),
        ServicioExtraDto(
          id: 'limpieza',
          nombre: 'Limpieza final',
          descripcion: 'Deja el espacio preparado al terminar.',
          precioCentimos: 1500,
        ),
      ],
      actividades: ['Eventos', 'Celebraciones', 'Comidas'],
      equipamiento: ['Mesas', 'Sillas', 'Zona exterior'],
      disponibilidad: ['Hoy: 16:00 - 23:00'],
      opiniones: ['Las vistas son muy agradables.'],
      precioHoraCentimos: 4200,
      moneda: 'EUR',
    ),
    EspacioDto(
      id: 'e6',
      nombre: 'Salón Central',
      descripcion: 'Salón diáfano para encuentros y actividades de grupo.',
      ubicacion: 'Casco antiguo',
      horario: 'Lunes a domingo, de 08:00 a 23:00',
      condicionesUso: 'El aforo máximo debe respetarse en todo momento.',
      aforo: 60,
      imagenAsset: 'assets/images/salon_central.jpg',
      imagenesAssets: [
        'assets/images/salon_central.jpg',
        'assets/images/salon_central_2.jpg',
      ],
      serviciosDisponibles: [
        ServicioExtraDto(
          id: 'catering',
          nombre: 'Catering',
          descripcion: 'Servicio de comida y bebida.',
          precioCentimos: 3500,
        ),
        ServicioExtraDto(
          id: 'proyector',
          nombre: 'Proyector',
          descripcion: 'Proyector y pantalla.',
          precioCentimos: 1200,
        ),
        ServicioExtraDto(
          id: 'limpieza',
          nombre: 'Limpieza final',
          descripcion: 'Deja el espacio preparado al terminar.',
          precioCentimos: 1500,
        ),
      ],
      actividades: ['Eventos', 'Reuniones', 'Presentaciones'],
      equipamiento: ['Wifi', 'Proyector', 'Mesas y sillas'],
      disponibilidad: ['Hoy: 08:00 - 23:00'],
      opiniones: ['Un salón amplio y bien situado.'],
      precioHoraCentimos: 5000,
      moneda: 'EUR',
    ),
  ];
}
