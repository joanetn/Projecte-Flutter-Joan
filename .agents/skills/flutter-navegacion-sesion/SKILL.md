---
name: flutter-navegacion-sesion
description: "Implementa o revisa navegación Flutter para login, registro, catálogo, detalle, reserva, mis reservas y perfil, incluyendo sesión simulada, rutas protegidas, back stack y conservación del espacio seleccionado. Usar al trabajar en navegación, autenticación simulada o flujo de reservas."
argument-hint: "Describe el recorrido o pantalla que quieres conectar"
---

# Navegación y sesión simulada

## Cuándo usar

- Conectar las pantallas principales del proyecto.
- Implementar login, registro o cierre de sesión simulado.
- Añadir o revisar el flujo detalle → nueva reserva → confirmación.
- Corregir problemas del botón Atrás o de rutas protegidas.

## Procedimiento

1. Enumerar las pantallas públicas y las pantallas disponibles solo durante una sesión.
2. Definir un único estado de sesión simulado y una navegación coherente desde el punto de entrada.
3. Tras un login correcto, reemplazar la ruta de acceso para que Atrás no vuelva al login.
4. Permitir pasar entre Principal, Mis reservas y Perfil sin perder el estado de la sesión.
5. Pasar explícitamente el espacio seleccionado desde el catálogo o detalle hasta Nueva reserva.
6. Conservar los datos del espacio durante la edición de la solicitud y al volver atrás.
7. Mostrar una confirmación con el resumen y dejar claro que la reserva no se guarda de forma real.
8. Al cerrar sesión, limpiar el estado y eliminar las rutas de la sesión anterior del historial.
9. Impedir que una ruta protegida sea accesible sin sesión; mostrar una transición clara al acceso.
10. Probar los recorridos normales y los casos de Atrás, cancelación, cierre de sesión y entrada directa.

## Checklist de aceptación

- Login → Principal no permite volver al login con Atrás.
- Principal → Detalle → Nueva reserva conserva el espacio correcto.
- Nueva reserva → Confirmación permite regresar sin perder el contexto esperado.
- Mis reservas muestra datos ficticios y estados claramente identificados.
- Cerrar sesión deja inaccesibles las pantallas de la sesión anterior.
