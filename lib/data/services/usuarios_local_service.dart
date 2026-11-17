import '../models/usuario_dto.dart';

class UsuariosLocalService {
  List<UsuarioDto> leerUsuarios() => const [
        UsuarioDto(
          id: 'u1',
          nombre: 'Usuario Demo',
          correo: 'demo@espacios.local',
        ),
      ];
}
