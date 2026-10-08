// main.dart
// Clase 20 — Cierre condensado de formularios (validación cruzada) y
// arranque del consumo de APIs REST con el paquete http.
// Desarrollo de Aplicaciones Móviles · ESEN · Ciclo 3/2026
//
// Esta app tiene dos pantallas independientes, una por cada bloque de
// la Clase 20:
//
//  1. ValidacionCruzadaScreen (Bloque 1) — un formulario de registro
//     con "contraseña" y "confirmar contraseña", donde el validator de
//     confirmación lee el TextEditingController del campo de
//     contraseña al momento de Form.validate(). Esto es lo que hace
//     cruzada a la validación: no puede resolverse con el value
//     aislado del propio campo.
//
//  2. ConsumoApiScreen (Bloque 2) — una solicitud GET real con el
//     paquete http contra JSONPlaceholder, con deserialización JSON
//     (Post.fromJson) y los tres estados de FutureBuilder (cargando,
//     error, datos). Incluye un interruptor "forzar error" que apunta
//     a una ruta inexistente, para poder demostrar el estado de error
//     en clase sin depender de que la red del salón falle por sí sola.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clase 20 · Formularios y consumo de APIs',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF1F3864),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clase 20')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bloque 1 — Validación cruzada',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ValidacionCruzadaScreen(),
                ),
              ),
              child: const Text('Abrir formulario de registro'),
            ),
            const SizedBox(height: 32),
            Text(
              'Bloque 2 — Consumo de API con http',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ConsumoApiScreen()),
              ),
              child: const Text('Abrir lista de publicaciones (GET)'),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// BLOQUE 1 — Validación cruzada entre "contraseña" y "confirmar contraseña"
// =============================================================================

class ValidacionCruzadaScreen extends StatefulWidget {
  const ValidacionCruzadaScreen({super.key});

  @override
  State<ValidacionCruzadaScreen> createState() =>
      _ValidacionCruzadaScreenState();
}

class _ValidacionCruzadaScreenState extends State<ValidacionCruzadaScreen> {
  // GlobalKey<FormState> como campo final de la clase State, nunca
  // dentro de build() (repaso de la Clase 19).
  final _formKey = GlobalKey<FormState>();

  final _usuarioController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmarController = TextEditingController();

  String? _mensaje;

  @override
  void dispose() {
    _usuarioController.dispose();
    _passwordController.dispose();
    _confirmarController.dispose();
    super.dispose();
  }

  String? _validarUsuario(String? value) {
    if (value == null || value.trim().length < 3) {
      return 'Ingresa un usuario (mínimo 3 caracteres)';
    }
    return null;
  }

  String? _validarPassword(String? value) {
    if (value == null || value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  // Validación cruzada (Clase 20): este validator no puede resolverse
  // solo con su propio "value". Necesita leer el .text del controlador
  // del campo "contraseña" al momento en que Form.validate() lo invoca.
  String? _validarConfirmacion(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirma la contraseña';
    }
    if (value != _passwordController.text) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _mensaje = 'Registro válido para "${_usuarioController.text}"';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulario válido')),
      );
    } else {
      setState(() => _mensaje = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validación cruzada')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _AvisoBloque(
                texto: 'El campo "Confirmar contraseña" valida contra el '
                    'controlador del campo "Contraseña", no contra su '
                    'propio value: por eso es una validación cruzada y no '
                    'puede resolverse con un validator aislado por campo.',
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _usuarioController,
                validator: _validarUsuario,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: _validarPassword,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _confirmarController,
                obscureText: true,
                validator: _validarConfirmacion,
                decoration: const InputDecoration(
                  labelText: 'Confirmar contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _registrar,
                child: const Text('Registrar'),
              ),
              if (_mensaje != null) ...[
                const SizedBox(height: 16),
                Text(_mensaje!, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// BLOQUE 2 — Consumo de API con http: GET, JSON y FutureBuilder
// =============================================================================

/// Modelo de datos para cada publicación recibida de la API.
class Post {
  final int id;
  final String title;
  final String body;

  const Post({required this.id, required this.title, required this.body});

  // fromJson construye el objeto Dart a partir del Map decodificado de
  // la respuesta JSON (Clase 20).
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

/// Solicitud GET con el paquete http contra JSONPlaceholder.
///
/// [forzarError] apunta a una ruta inexistente a propósito, para poder
/// demostrar en clase el estado de error de FutureBuilder sin depender
/// de que la red falle por sí sola.
Future<List<Post>> fetchPosts({required bool forzarError}) async {
  final uri = forzarError
      ? Uri.parse('https://jsonplaceholder.typicode.com/ruta-que-no-existe')
      : Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=10');

  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('La API respondió con el código ${response.statusCode}');
  }

  final List<dynamic> datos = jsonDecode(response.body) as List<dynamic>;
  return datos
      .map((item) => Post.fromJson(item as Map<String, dynamic>))
      .toList();
}

class ConsumoApiScreen extends StatefulWidget {
  const ConsumoApiScreen({super.key});

  @override
  State<ConsumoApiScreen> createState() => _ConsumoApiScreenState();
}

class _ConsumoApiScreenState extends State<ConsumoApiScreen> {
  bool _forzarError = false;
  late Future<List<Post>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = fetchPosts(forzarError: _forzarError);
  }

  void _recargar() {
    setState(() {
      _futurePosts = fetchPosts(forzarError: _forzarError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consumo de API (GET)')),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Forzar error (endpoint inexistente)'),
            subtitle: const Text(
              'Útil para demostrar el estado de error sin depender de la red del salón',
            ),
            value: _forzarError,
            onChanged: (value) {
              setState(() => _forzarError = value);
              _recargar();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                onPressed: _recargar,
                child: const Text('Recargar'),
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: FutureBuilder<List<Post>>(
              future: _futurePosts,
              builder: (context, snapshot) {
                // Estado 1 de FutureBuilder: la solicitud sigue en curso.
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                // Estado 2 de FutureBuilder: la solicitud falló.
                if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Ocurrió un error al consultar la API:\n${snapshot.error}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                // Estado 3 de FutureBuilder: la solicitud tuvo éxito.
                final posts = snapshot.data ?? const <Post>[];
                if (posts.isEmpty) {
                  return const Center(child: Text('Sin datos'));
                }
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      leading: CircleAvatar(child: Text('${post.id}')),
                      title: Text(
                        post.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        post.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AvisoBloque extends StatelessWidget {
  const _AvisoBloque({required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(texto, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
