# Explicación de `login_screen.dart`

Archivo relacionado: [`lib/ui/acceso/ui/login_screen.dart`](../lib/ui/acceso/ui/login_screen.dart)

Esta pantalla representa el acceso de la aplicación. Actualmente es un acceso
simulado: solo comprueba que los campos no estén vacíos y no verifica un correo
ni una contraseña contra una base de datos.

## 1. Importaciones

```dart
import 'package:flutter/material.dart';
```

Importa los widgets de Flutter: `Scaffold`, `TextFormField`, `Form`, `Icon`,
`Navigator`, estilos y el resto de componentes visuales.

```dart
import '../../core/ui/button.dart';
import 'registro_screen.dart';
```

- `button.dart` contiene el botón reutilizable `Boton`.
- `registro_screen.dart` permite abrir la pantalla de registro.

La ruta `../../` sube desde `ui/acceso/ui` hasta `ui` y después entra en
`core/ui`.

## 2. `LoginScreen`

```dart
class LoginScreen extends StatefulWidget
```

La pantalla es un `StatefulWidget` porque tiene datos que pueden cambiar
mientras el usuario interactúa:

- Mostrar u ocultar la contraseña.
- Validar el formulario.

El constructor tiene `const` porque la configuración inicial de la pantalla no
necesita cambiar.

## 3. `_LoginScreenState`

Esta clase contiene el estado y la lógica de la pantalla.

```dart
final _formKey = GlobalKey<FormState>();
```

El `GlobalKey<FormState>` identifica el formulario. Gracias a esta clave se
puede llamar a:

```dart
_formKey.currentState!.validate()
```

Ese método ejecuta los validadores de todos los campos del formulario.

```dart
bool _ocultarContrasena = true;
```

Controla si la contraseña se muestra oculta. Al principio vale `true`, por lo
que el texto aparece oculto.

El guion bajo inicial significa que la variable es privada para este archivo.

## 4. Método `_entrar`

```dart
void _entrar() {
  if (_formKey.currentState!.validate()) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const _PrincipalDemoScreen()),
    );
  }
}
```

Este método se ejecuta al pulsar el botón **Entrar**.

### Validación

Primero se valida el formulario. Si algún campo está vacío, el método devuelve
`false`, se muestran los mensajes de error y no se cambia de pantalla.

### Navegación

Cuando la validación es correcta se usa:

```dart
Navigator.of(context).pushReplacement(...)
```

`pushReplacement` abre la pantalla principal y sustituye el login en la pila de
navegación. Esto es importante porque el requisito indica que, después de
entrar, el botón Atrás no debe devolver al login.

Si se utilizase `push` en lugar de `pushReplacement`, el login permanecería
debajo de la pantalla principal.

## 5. `build`

El método `build` describe cómo se dibuja la pantalla.

### `Scaffold`

`Scaffold` proporciona la estructura básica de una pantalla Material:

- Fondo.
- Barra superior si se utiliza.
- Cuerpo principal.

En el login se utiliza un fondo crema:

```dart
backgroundColor: const Color.fromRGBO(246, 243, 236, 1)
```

### `SafeArea`

Evita que el contenido quede debajo de elementos del sistema, como la barra de
estado o el notch del móvil.

### `Form`

Agrupa los campos de correo y contraseña. Recibe `_formKey` para poder
validarse desde `_entrar`.

### `ListView`

Contiene el contenido vertical y permite desplazarse si la pantalla es
pequeña. El `padding` deja espacio alrededor de todo el formulario.

## 6. Cabecera visual

El `Container` azul pizarra contiene un icono de sala:

```dart
Icons.meeting_room_outlined
```

El `BoxDecoration` permite configurar:

- `color`: color del fondo.
- `borderRadius`: esquinas redondeadas.

Después aparecen el título **Bienvenido** y el texto descriptivo.

## 7. Campo de correo

```dart
TextFormField(
  keyboardType: TextInputType.emailAddress,
  decoration: _decoracion(...),
  validator: _campoObligatorio,
)
```

`TextFormField` es un campo de texto que puede participar en un `Form`.

- `keyboardType` solicita un teclado adecuado para correos.
- `decoration` define el texto, icono, bordes y colores.
- `validator` comprueba el contenido.

Actualmente solo se comprueba que no esté vacío. Todavía no se valida el
formato real del correo.

## 8. Campo de contraseña

```dart
obscureText: _ocultarContrasena
```

Cuando el valor es `true`, Flutter oculta los caracteres.

El `IconButton` cambia el valor mediante `setState`:

```dart
setState(() {
  _ocultarContrasena = !_ocultarContrasena;
});
```

`setState` avisa a Flutter de que debe volver a ejecutar `build` para actualizar
el campo y el icono.

## 9. Botón de entrada

```dart
Boton(
  texto: 'Entrar',
  icono: Icons.arrow_forward,
  ancho: double.infinity,
  onPressed: _entrar,
)
```

Es el componente reutilizable de la aplicación. Recibe:

- El texto que se muestra.
- El icono.
- El ancho.
- La acción que se ejecuta al pulsarlo.

La acción no se ejecuta directamente al construir el widget; se pasa como
referencia mediante `onPressed`.

## 10. Ir al registro

El segundo botón utiliza:

```dart
tipo: TipoBoton.texto
```

Así se muestra como un botón de texto, menos destacado que la acción
principal.

Al pulsarlo:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (_) => const RegistroScreen(),
  ),
)
```

Se añade la pantalla de registro encima del login. Por eso el botón Atrás del
registro vuelve al login.

## 11. `_decoracion`

Este método evita repetir la misma configuración en los dos campos.

Recibe:

- `etiqueta`: texto del campo.
- `icono`: icono situado a la izquierda.
- `sufijo`: widget opcional situado a la derecha, usado para el ojo de la
  contraseña.

También configura:

- Fondo blanco.
- Bordes redondeados.
- Borde mostaza cuando el campo tiene el foco.

Crear este método es una pequeña reutilización visual: si se cambia el estilo
de los campos, se cambia en un solo sitio.

## 12. `_campoObligatorio`

```dart
String? _campoObligatorio(String? valor)
```

Un validador devuelve:

- Un `String` si hay un error.
- `null` si el valor es correcto.

En este caso, si el valor es `null`, está vacío o solo contiene espacios,
devuelve:

```text
Este campo es obligatorio
```

## 13. `_PrincipalDemoScreen`

Es una pantalla privada y provisional que permite probar el recorrido después
del login. No es todavía el catálogo real de espacios.

Más adelante debe sustituirse por la pantalla Principal que tendrá:

- El catálogo de al menos seis espacios.
- Acceso a los detalles.
- Navegación hacia reservas, perfil y mis reservas.

## 14. Recorrido actual

```text
Login
  ├── Regístrate → Registro
  │                    ├── Atrás → Login
  │                    └── Registro correcto → Confirmación → Login
  └── Entrar → Principal de demostración
```

El acceso todavía no usa `UsuariosRepository`. Cuando se implemente el acceso
real o simulado mediante datos, `_entrar` deberá llamar al repositorio y
reaccionar a sus estados de éxito o error.
