# Espacios Demo

Aplicación Flutter de demostración para consultar espacios y simular
solicitudes de reserva. Proyecto de Joan, realizado para PMDM.

## Requisitos y ejecución

- Flutter instalado.
- Dart `3.13.4` o compatible con `sdk: ^3.13.4`.

```bash
flutter pub get
flutter run
```

La aplicación funciona con datos ficticios y no necesita red, API, base de
datos ni credenciales reales.

## Arquitectura

El proyecto separa las responsabilidades en tres zonas:

- `lib/domain/models/`: modelos que representan los datos de la aplicación.
- `lib/data/models/`: DTO que representan los datos de la fuente simulada.
- `lib/data/services/`: servicios locales con datos de demostración.
- `lib/data/repositories/`: transformación de DTO a modelos de dominio.
- `lib/ui/`: pantallas y componentes visuales.

El recorrido de lectura es:

```text
Pantalla -> Repositorio -> Servicio local -> DTO
                         <- Modelo de dominio
```

## Pantallas y recorrido

1. **Login**: escribe cualquier correo y contraseña no vacíos. El acceso es
   simulado y sustituye la ruta de login para que Atrás no vuelva al acceso.
2. **Registro**: desde «Regístrate» se abre el formulario. Al completar los
   campos aparece una confirmación simulada y se puede volver al login.
3. **Principal**: muestra seis espacios desplazables.
4. **Detalle**: desde «Ver detalle» se conserva el espacio seleccionado y se
   muestran galería de ejemplo, descripción, ubicación, aforo, precio,
   horario, condiciones, actividades, equipamiento, servicios, disponibilidad y
   opiniones.
5. **Nueva reserva**: permite indicar actividad, asistentes, fecha, hora,
   duración y servicios adicionales. El precio se recalcula al seleccionar
   servicios.
6. **Mis reservas**: muestra dos reservas ficticias con sus estados, fechas,
   asistentes y precios.
7. **Perfil y ajustes**: muestra el usuario demo, preferencias, información de
   la aplicación y cierre de sesión.

La navegación inferior conecta Principal, Mis reservas y Perfil. Cerrar sesión
elimina las rutas de la sesión y devuelve al login.

## Datos de demostración

El catálogo contiene seis espacios:

- Sala Mirador.
- Patio Naranja.
- Aula Norte.
- Estudio Luz.
- Terraza Olivo.
- Salón Central.

Para probar el flujo completo:

1. Entra con cualquier correo y contraseña.
2. Abre un espacio y pulsa «Ver detalle».
3. Pulsa «Nueva reserva».
4. Cambia duración y selecciona servicios para ver el total actualizado.
5. Confirma la solicitud y revisa el mensaje de simulación.
6. Usa la navegación inferior para consultar reservas y perfil.

## Criterios visuales

Se utiliza una paleta sobria basada en crema, blanco, azul pizarra, mostaza
apagado, gris carbón y verde grisáceo. Los valores exactos están documentados
en `.agents/instrucciones.md`.

El componente `Boton` de `lib/ui/core/ui/button.dart` permite reutilizar
botones principales, secundarios y de texto con texto, icono, colores,
padding, tamaño, radio y acción configurables.

## Funcionalidades simuladas y limitaciones

- El login no comprueba credenciales.
- El registro no crea usuarios persistentes.
- Las reservas no se guardan ni modifican disponibilidad.
- Las imágenes son marcadores visuales de la demo; no hay backend de imágenes.
- Los servicios, opiniones y disponibilidad son ejemplos estáticos.
- No existe todavía autenticación, persistencia, red ni pagos reales.

La referencia de arquitectura y campos utilizada es:

https://jovisal1.github.io/ApuntesPMDM/proyecto-integrador/entrega-1/
