# Clase 20 · Validación cruzada y arranque del consumo de APIs

App de ejemplo para la Clase 20 (Semana 7, Desarrollo de Aplicaciones Móviles),
ya reorganizada para condensar el cierre de formularios y adelantar el
consumo de APIs REST. Tiene dos pantallas independientes, una por cada
bloque de la clase:

## Bloque 1 — Validación cruzada (`ValidacionCruzadaScreen`)

Un formulario de registro con los campos "Usuario", "Contraseña" y
"Confirmar contraseña". El `validator` del campo de confirmación no
depende solo de su propio `value`: lee el `.text` del
`TextEditingController` del campo "Contraseña" al momento en que
`Form.validate()` se invoca. Esa lectura cruzada entre dos campos es lo
que distingue una validación cruzada de un `validator` aislado por
campo (visto en la Clase 19).

## Bloque 2 — Consumo de API con `http` (`ConsumoApiScreen`)

Una solicitud GET real contra [JSONPlaceholder](https://jsonplaceholder.typicode.com/posts),
con:

- El paquete `http` para enviar la solicitud y leer `statusCode` y `body`.
- `Post.fromJson` para deserializar cada elemento del JSON a un objeto Dart.
- `FutureBuilder` mostrando sus tres estados: cargando
  (`ConnectionState.waiting`), error (`snapshot.hasError`) y datos
  (`snapshot.data`).

Incluye un interruptor **"Forzar error"** que cambia la solicitud a una
ruta inexistente del mismo servidor. Está pensado para que, en clase,
se pueda mostrar el estado de error de `FutureBuilder` de forma
confiable, sin depender de que la red del salón falle por sí sola en
el momento exacto de la demostración.

Referencia bibliográfica de la semana: Alessandria, Yovo y Anwar,
*Flutter Cookbook, Third Edition* (Packt Publishing, 2026), Capítulo 9,
"Working with REST APIs" (capítulo completo).

## Cómo correrla

Si ya tienes un proyecto Flutter creado, copia `lib/main.dart` dentro de
tu proyecto (reemplazando el `main.dart` existente), copia también las
dependencias de este `pubspec.yaml` al tuyo, corre `flutter pub get` y
luego `flutter run`.

Para crear el proyecto desde cero con esta carpeta:

```bash
flutter create . --project-name clase20_formularios_api
flutter pub get
flutter run
```

(`flutter create .` regenera las carpetas de plataforma — `android/`,
`ios/`, etc. — que no se incluyen aquí; `pubspec.yaml` y `lib/main.dart`
ya están listos.)

**Nota:** este proyecto necesita conexión a internet para el Bloque 2
(consume un endpoint real de prueba, JSONPlaceholder). No requiere
ninguna llave ni registro.

**Importante:** este código no pudo compilarse ni ejecutarse en el
entorno donde se generó (no hay SDK de Flutter/Dart instalado aquí).
Se revisó a mano con cuidado, pero conviene correr
`flutter analyze` y `flutter run` antes de usarlo en clase.
