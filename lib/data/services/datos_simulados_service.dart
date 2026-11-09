import '../models/usuario_dto.dart';

class DatosSimuladosService {
  final List<UsuarioDto> usuarios = [];

  UsuarioDto registrarUsuario(UsuarioDto usuario) {
    usuarios.add(usuario);
    return usuario;
  }
}
