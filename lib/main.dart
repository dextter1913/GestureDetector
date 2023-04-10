import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Gesture Detector",
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    String titulo = "Gesture Detector";
    String texto = "mis videos";
    String texto2 = "mis imagenes";
    String texto3 = "mis documentos";
    String texto4 = "mis audios";
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Center(
        child: ListView(
          children: [
            _MyGestureDetector(texto),
            _MyGestureDetector(texto2),
            _MyGestureDetector(texto3),
            _MyGestureDetector(texto4),
          ],
        ),
      ),
    );
  }
}

class _MyGestureDetector extends StatelessWidget {
  final String texto;
  const _MyGestureDetector(this.texto);
  @override
  Widget build(BuildContext context) {
    var icono = _iconValidator(texto)["iconos"] as IconData;
    var txt = _iconValidator(texto)["text"] as String;
    return GestureDetector(
      onTap: _ontap,
      onLongPress: _onlogpress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icono,
              size: 100,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(txt),
          ],
        ),
      ),
    );
  }

  void _ontap() {
    if (kDebugMode) {
      print("holiiii");
    }
  }

  void _onlogpress() {
    if (kDebugMode) {
      print("se a mantenido el click holiii de nuevo");
    }
  }

  Map<String, Object> _iconValidator(String texto) {
    Object icon;
    switch (texto) {
      case "mis videos":
        icon = Icons.movie_creation_outlined;
        break;
      case "mis imagenes":
        icon = Icons.image;
        break;
      case "mis documentos":
        icon = Icons.note_outlined;
        break;
      case "mis audios":
        icon = Icons.audio_file_outlined;
        break;
      default:
        icon = Icons.error_outline;
        break;
    }

    return {
      "iconos": icon,
      "text": texto,
    };
  }
}
