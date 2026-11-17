import '../../domain/models/usuario.dart';
import '../models/usuario_dto.dart';
import '../services/datos_simulados_service.dart';

class UsuariosRepository {
  UsuariosRepository({required this._service});

  final DatosSimuladosService _service;

  Usuario registrar({
    required String nombre,
    required String correo,
    required String contrasena,
  }) {
    final usuarioDto = UsuarioDto(
      id: 'usuario-${_service.usuarios.length + 1}',
      nombre: nombre,
      correo: correo,
    );
    final usuarioGuardado = _service.registrarUsuario(usuarioDto);

    return Usuario(
      id: usuarioGuardado.id,
      nombre: usuarioGuardado.nombre,
      correo: usuarioGuardado.correo,
    );
  }
}
