---
name: flutter-arquitectura-mvvm
description: "Diseña o revisa funcionalidades Flutter con la arquitectura del proyecto: domain para modelos y contratos, data para DTO, servicios y repositorios, y ui para pantallas, componentes y ViewModels. Usar al crear, reorganizar o revisar código de arquitectura."
argument-hint: "Describe la funcionalidad Flutter que quieres implementar o revisar"
---

# Arquitectura Flutter del proyecto

## Cuándo usar

- Añadir una pantalla o flujo nuevo.
- Crear o modificar modelos, DTO, servicios o repositorios.
- Revisar que una funcionalidad respete la separación `domain`, `data` y `ui`.
- Crear o revisar ViewModels y el estado de una pantalla.

## Procedimiento

1. Identificar el caso de uso y los datos que necesita la pantalla.
2. Definir primero los modelos del dominio en `lib/domain/models`.
3. Crear DTO y conversiones en `lib/data/models` cuando la representación de datos lo requiera.
4. Encapsular los datos ficticios o el acceso simulado en `lib/data/services`.
5. Exponer las operaciones mediante repositorios en `lib/data/repositories`; las pantallas no deben acceder directamente a los datos.
6. Implementar el estado y las acciones de la pantalla en un ViewModel dentro de `lib/ui`.
7. Mantener los widgets centrados en presentación, interacción y navegación.
8. Reutilizar componentes visuales existentes antes de crear uno nuevo.
9. Comprobar que los nombres y responsabilidades coinciden con la estructura explicada en `README.md`.
10. Validar que la funcionalidad sigue funcionando con datos ficticios y que no introduce persistencia real.

## Criterios de revisión

- Las dependencias apuntan hacia dentro: `ui` usa repositorios y modelos, no detalles de servicios.
- No se mezclan DTO con modelos de dominio en widgets.
- Los estados de carga, éxito y error son explícitos.
- El ViewModel no contiene lógica de layout.
- Las conversiones entre DTO y dominio son claras y comprobables.
