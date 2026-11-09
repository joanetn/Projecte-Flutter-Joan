---
name: flutter-datos-simulados
description: "Crea, organiza y revisa datos ficticios y servicios simulados para una app Flutter de espacios y reservas. Usar al preparar catálogos, usuarios, servicios, disponibilidad, opiniones, reservas o confirmaciones sin backend ni persistencia real."
argument-hint: "Indica qué datos ficticios o simulación necesita la funcionalidad"
---

# Datos ficticios y simulaciones

## Cuándo usar

- Preparar el catálogo inicial de espacios.
- Añadir usuarios, reservas, opiniones, servicios o disponibilidad de ejemplo.
- Simular login, registro, confirmación de reserva o cierre de sesión.
- Revisar que una pantalla no sugiera que existe un backend real.

## Procedimiento

1. Identificar los modelos de dominio necesarios antes de crear los datos.
2. Centralizar los datos de demostración en servicios o fuentes de `data`, evitando literales repetidos en widgets.
3. Proporcionar como mínimo seis espacios completos y variados para el catálogo.
4. Incluir datos coherentes para galería, servicios, disponibilidad y opiniones del detalle.
5. Incluir al menos dos reservas ficticias con precio, datos y estado visible.
6. Calcular el precio de la nueva reserva a partir de sus datos y servicios seleccionados, sin valores ocultos en la interfaz.
7. Marcar los accesos, registros, confirmaciones y reservas como simulados cuando se muestran al usuario.
8. No añadir llamadas de red, credenciales reales, base de datos ni persistencia accidental.
9. Mantener identificadores y relaciones consistentes entre espacios, reservas y servicios.
10. Documentar en `README.md` las limitaciones y los datos o pasos necesarios para la demostración.

## Criterios de revisión

- Los datos son deterministas y permiten repetir la demostración.
- Los precios mostrados coinciden con los datos seleccionados.
- Una operación simulada no se presenta como realizada en un sistema real.
- Los estados vacíos, inválidos o no disponibles tienen una respuesta visible y comprensible.
