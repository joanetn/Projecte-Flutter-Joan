import 'package:flutter/material.dart';

enum TipoBoton {
  principal,
  secundario,
  texto,
}

class Boton extends StatelessWidget {
  const Boton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.tipo = TipoBoton.principal,
    this.tamanoLetra = 16,
    this.colorFondo,
    this.colorTexto,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 12,
    ),
    this.radio = 8,
    this.icono,
    this.ancho,
    this.alto,
    this.habilitado = true,
  });

  final String texto;
  final VoidCallback? onPressed;
  final TipoBoton tipo;
  final double tamanoLetra;
  final Color? colorFondo;
  final Color? colorTexto;
  final EdgeInsetsGeometry padding;
  final double radio;
  final IconData? icono;
  final double? ancho;
  final double? alto;
  final bool habilitado;

  @override
  Widget build(BuildContext context) {
    const colorPrincipalPorDefecto = Color.fromRGBO(190, 150, 82, 1);
    const colorTextoPorDefecto = Color.fromRGBO(255, 255, 255, 1);
    final colorPrincipal = colorFondo ?? colorPrincipalPorDefecto;
    final colorTextoFinal = colorTexto ??
        (tipo == TipoBoton.principal
            ? colorTextoPorDefecto
            : colorPrincipal);
    final style = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        tipo == TipoBoton.principal ? colorPrincipal : Colors.transparent,
      ),
      foregroundColor: WidgetStatePropertyAll(colorTextoFinal),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      padding: WidgetStatePropertyAll(padding),
      minimumSize: WidgetStatePropertyAll(
        Size(ancho ?? 0, alto ?? 0),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radio),
          side: tipo == TipoBoton.secundario
              ? BorderSide(color: colorPrincipal)
              : BorderSide.none,
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: tamanoLetra),
      ),
    );
    final accion = habilitado ? onPressed : null;
    final contenido = icono == null
        ? Text(texto)
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icono, size: tamanoLetra + 2),
              const SizedBox(width: 8),
              Text(texto),
            ],
          );

    return switch (tipo) {
      TipoBoton.principal => ElevatedButton(
          onPressed: accion,
          style: style,
          child: contenido,
        ),
      TipoBoton.secundario => OutlinedButton(
          onPressed: accion,
          style: style,
          child: contenido,
        ),
      TipoBoton.texto => TextButton(
          onPressed: accion,
          style: style,
          child: contenido,
        ),
    };
  }
}