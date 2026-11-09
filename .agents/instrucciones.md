Desarrolla una primera versión navegable de la aplicación, organizada según la arquitectura trabajada en clase: modelos y contratos en domain, servicios, DTO y repositorios en data, y pantallas y ViewModels en ui. Los datos serán ficticios y el acceso y las reservas estarán identificados como simulaciones.

Referencia de arquitectura y campos:

https://jovisal1.github.io/ApuntesPMDM/proyecto-integrador/entrega-1/

Usa también las subsecciones y ejemplos incluidos dentro de `entrega-1` como referencia para los modelos de dominio, DTO, servicios locales, repositorios y pantallas.

Pantallas mínimas

La aplicación debe incluir, al menos:

Login: acceso simulado y enlace al registro. Tras entrar, el botón Atrás no debe regresar al login.
Registro: formulario de alta ficticia, confirmación simulada y posibilidad de volver al login.
Principal: catálogo desplazable con un mínimo de seis espacios y acceso al detalle de cada uno.
Detalle del espacio: información completa, galería, servicios, disponibilidad y opiniones de ejemplo, además del acceso a Nueva reserva.
Nueva reserva: identificación del espacio seleccionado, datos de la solicitud, selección de servicios adicionales y cálculo actualizado del precio. La confirmación mostrará el resumen e indicará que no se guarda una reserva real.
Mis reservas: al menos dos reservas ficticias con sus datos, precios y estados claramente identificados.
Perfil y ajustes: datos del usuario ficticio, preferencias, información de la aplicación y cierre de sesión.
Debe poderse navegar entre Principal, Mis reservas y Perfil de forma coherente. El recorrido de reserva conservará el espacio seleccionado y permitirá volver. Al cerrar sesión, las pantallas de la sesión anterior no deben quedar accesibles. Se permite libertad de diseño, manteniendo una apariencia coherente y reutilizando los componentes visuales que se repitan.

Paleta de colores

Usa una paleta suave, sobria y agradable a la vista. Evita colores fluorescentes, saturados o combinaciones con demasiado contraste.

- Fondo principal: `rgba(246, 243, 236, 1)` (crema claro).
- Superficies y tarjetas: `rgba(255, 255, 255, 1)` (blanco).
- Color principal: `rgba(54, 76, 92, 1)` (azul pizarra).
- Color principal oscuro: `rgba(35, 51, 62, 1)` (azul pizarra oscuro).
- Color secundario: `rgba(190, 150, 82, 1)` (mostaza apagado).
- Texto principal: `rgba(43, 47, 50, 1)` (gris carbón).
- Texto secundario: `rgba(105, 111, 113, 1)` (gris medio).
- Bordes y divisores: `rgba(218, 215, 205, 1)` (arena claro).
- Fondo alternativo: `rgba(232, 235, 231, 1)` (gris verdoso muy claro).
- Éxito: `rgba(115, 155, 139, 1)` (verde salvia).
- Aviso o error: `rgba(157, 119, 78, 1)` (marrón suave).

Reglas visuales:

- Usa el color principal para acciones principales, navegación seleccionada y elementos destacados.
- Usa el color principal oscuro para textos sobre fondos claros cuando se necesite más contraste.
- Usa el color secundario solo como acento, no como fondo dominante.
- Mantén los fondos y las superficies claros para facilitar la lectura.
- Los textos deben respetar un contraste suficiente con el fondo.
- Reutiliza esta paleta en todas las pantallas y componentes, incluido el botón reutilizable.

README mínimo

El repositorio debe contener un README.md que incluya:

Nombre del proyecto, autoría y breve descripción.
Versiones de Flutter y Dart utilizadas e instrucciones para instalar las dependencias y ejecutar la aplicación.
Explicación de la estructura de carpetas y de la arquitectura aplicada.
Relación de pantallas implementadas y recorrido para probarlas.
Datos o pasos necesarios para acceder a la demostración.
Criterios visuales acordados y componentes reutilizables creados.
Funcionalidades simuladas, limitaciones y aspectos pendientes.

Arquitectura de ejemplo (no tienen porque ser los mismos archivos es para ver la estructura de carpetas)

lib/
├── main.dart
├── ui/
│   ├── core/
│   │   └── ui/
│   │       ├── espacio_tarjeta.dart
│   │       └── reserva_tarjeta.dart
│   ├── acceso/ui/
│   │   ├── login_screen.dart
│   │   └── registro_screen.dart
│   ├── espacios/ui/
│   │   ├── espacios_screen.dart
│   │   └── espacio_detalle_screen.dart
│   ├── reservas/ui/
│   │   ├── nueva_reserva_screen.dart
│   │   └── mis_reservas_screen.dart
│   └── perfil/ui/perfil_screen.dart
├── domain/models/
│   ├── espacio.dart
│   ├── reserva.dart
│   ├── usuario.dart
│   ├── contacto_local.dart
│   ├── servicio_extra.dart
│   ├── servicio_contratado.dart
│   ├── comentario.dart
│   ├── disponibilidad_dia.dart
│   └── franja_disponibilidad.dart
└── data/
    ├── models/
    │   ├── espacio_dto.dart
    │   ├── reserva_dto.dart
    │   ├── usuario_dto.dart
    │   ├── contacto_local_dto.dart
    │   ├── servicio_extra_dto.dart
    │   ├── servicio_contratado_dto.dart
    │   ├── comentario_dto.dart
    │   ├── disponibilidad_dia_dto.dart
    │   └── franja_disponibilidad_dto.dart
    ├── repositories/
    │   ├── espacios_repository.dart
    │   ├── usuarios_repository.dart
    │   ├── reservas_repository.dart
    │   ├── comentarios_repository.dart
    │   └── disponibilidad_repository.dart
    └── services/
        ├── datos_demo.dart
        └── datos_simulados_service.dart
assets/images/
README.md
pubspec.yaml