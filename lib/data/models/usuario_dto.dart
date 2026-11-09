class UsuarioDto {
  const UsuarioDto({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.contrasena,
  });

  final String id;
  final String nombre;
  final String correo;
  final String contrasena;
}