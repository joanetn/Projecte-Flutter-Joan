# Explicación de `registro_screen.dart`

Archivo relacionado: [`lib/ui/acceso/ui/registro_screen.dart`](../lib/ui/acceso/ui/registro_screen.dart)

Esta pantalla representa el alta de un usuario. Según los requisitos del
proyecto, el registro es ficticio: muestra el formulario, valida que haya
datos y enseña una confirmación, pero no guarda una cuenta real.

## 1. Importaciones

```dart
import 'package:flutter/material.dart';
```

Importa los widgets y las clases de Flutter necesarios para construir la
pantalla.

```dart
import '../../core/ui/button.dart';
```

Importa el botón común `Boton`, que se reutiliza tanto para registrar como para
volver al login.

## 2. `RegistroScreen`

```dart
class RegistroScreen extends StatefulWidget
```

Es un `StatefulWidget` porque la pantalla tiene estado que cambia:

- La contraseña puede mostrarse u ocultarse.
- La confirmación de contraseña puede mostrarse u ocultarse.
- El formulario puede mostrar errores de validación.

## 3. Estado privado

```dart
final _formKey = GlobalKey<FormState>();
```

Identifica el formulario y permite validar todos sus campos desde `_registrar`.

```dart
bool _ocultarContrasena = true;
bool _ocultarConfirmacion = true;
```

Cada booleano controla un campo diferente. Se mantienen separados porque el
usuario puede cambiar la visibilidad de una contraseña sin cambiar la otra.

## 4. Método `_registrar`

```dart
Future<void> _registrar() async
```

Es `async` porque utiliza `showDialog`, que devuelve un `Future` que termina
cuando el diálogo se cierra.

### Primero se valida

```dart
if (!_formKey.currentState!.validate()) {
  return;
}
```

Si algún campo está vacío:

1. El formulario muestra el error.
2. `validate()` devuelve `false`.
3. `return` detiene el método.
4. No aparece la confirmación.

### Después se muestra la confirmación

```dart
await showDialog<void>(...)
```

`showDialog` coloca una ventana encima de la pantalla actual. El usuario debe
interactuar con ella antes de continuar.

El diálogo informa de dos cosas importantes:

- El registro se ha completado de forma simulada.
- No se ha guardado ningún usuario real.

Esto cumple la indicación del proyecto de identificar claramente las
funcionalidades ficticias.

## 5. Volver al login después del registro

El diálogo contiene un `Boton` con esta acción:

```dart
Navigator.of(context).pop();
Navigator.of(context).pop();
```

Los dos `pop` tienen funciones distintas:

1. El primer `pop` cierra el diálogo.
2. El segundo `pop` cierra la pantalla de registro y descubre el login que
   estaba debajo.

Por eso el usuario puede volver al login después de completar el registro.

## 6. `build`

El `Scaffold` define la pantalla y utiliza el fondo crema de la paleta.

El `AppBar` muestra el título **Crear cuenta**. Como el registro se abrió con
`Navigator.push`, el botón Atrás del `AppBar` vuelve al login.

El cuerpo contiene un `Form` y un `ListView`:

- `Form` agrupa los campos y sus validadores.
- `ListView` permite desplazarse en pantallas pequeñas.
- `padding` separa el contenido de los bordes.

## 7. Título y descripción

El título **Regístrate** utiliza el azul pizarra oscuro y un tamaño mayor para
crear una jerarquía visual.

El texto inferior explica que se trata de una cuenta ficticia. Esta aclaración
es útil durante la demostración para que no parezca que existe un sistema de
usuarios real.

## 8. Campo de nombre

```dart
TextFormField(
  decoration: _decoracion('Nombre', Icons.person_outline),
  validator: _campoObligatorio,
)
```

Permite escribir el nombre y exige que el campo no esté vacío.

## 9. Campo de correo

El campo utiliza:

```dart
keyboardType: TextInputType.emailAddress
```

Esto solicita un teclado adaptado a direcciones de correo en dispositivos
móviles. Actualmente el validador solo comprueba que haya texto; todavía no
comprueba que el formato sea un correo válido.

## 10. Campo de contraseña

El campo usa:

```dart
obscureText: _ocultarContrasena
```

El icono del ojo cambia la variable dentro de `setState`. Así Flutter vuelve a
dibujar el campo con la contraseña visible u oculta.

## 11. Campo de confirmación

El campo **Repite la contraseña** funciona igual que el anterior, pero utiliza
su propio estado:

```dart
_ocultarConfirmacion
```

Actualmente se comprueba que no esté vacío, pero todavía no se compara su
contenido con la contraseña original. Esa comparación será una mejora necesaria
cuando se complete la validación del registro.

## 12. Botón Registrarme

```dart
Boton(
  texto: 'Registrarme',
  icono: Icons.person_add_alt_1,
  ancho: double.infinity,
  onPressed: _registrar,
)
```

El botón:

- Usa el componente común de la aplicación.
- Ocupa todo el ancho disponible.
- Muestra un icono de alta de usuario.
- Ejecuta `_registrar` al pulsarlo.

La acción se pasa como callback para separar el botón visual de la lógica del
formulario.

## 13. Botón para volver al login

```dart
Boton(
  texto: 'Ya tengo una cuenta',
  tipo: TipoBoton.texto,
  onPressed: () => Navigator.of(context).pop(),
)
```

Es un botón de texto porque es una acción secundaria. Al pulsarlo, se elimina
la pantalla actual de la pila y vuelve directamente al login.

## 14. `_decoracion`

Este método centraliza el aspecto de todos los campos del registro.

Recibe:

- El texto de la etiqueta.
- El icono de la izquierda.
- Un widget opcional para la derecha.

El widget opcional se usa para los botones de mostrar u ocultar contraseña.

También define:

- Campos con fondo blanco.
- Bordes redondeados.
- Borde mostaza cuando el campo está seleccionado.

## 15. `_campoObligatorio`

Es el validador compartido por los cuatro campos. Un validador de Flutter
devuelve `null` cuando el valor es correcto y un texto cuando existe un error.

La expresión:

```dart
valor == null || valor.trim().isEmpty
```

comprueba tanto un valor inexistente como un campo vacío o compuesto solo por
espacios.

## 16. Recorrido actual

```text
Login
  └── Regístrate → Registro
                    ├── Ya tengo una cuenta → Login
                    ├── Atrás → Login
                    └── Registrarme
                          ├── Campos vacíos → errores
                          └── Campos completos → confirmación simulada → Login
```

## 17. Qué falta para conectarlo con datos

Actualmente `_registrar` solo muestra un diálogo. Cuando se conecte con la
capa `data`, el flujo debería:

1. Leer los valores de los campos mediante `TextEditingController`.
2. Crear el modelo o DTO correspondiente.
3. Llamar a `UsuariosRepository`.
4. Mostrar un estado de carga mientras se procesa.
5. Mostrar un error si el registro falla.
6. Mostrar la confirmación solo si el registro termina correctamente.

La pantalla no debería acceder directamente a `DatosSimuladosService`; debe
usar el repositorio para mantener la separación entre `ui` y `data`.
