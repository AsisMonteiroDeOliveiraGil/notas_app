import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/nota.dart';
import '../providers/notas_provider.dart';

class NoteAddScreen extends ConsumerStatefulWidget {
  const NoteAddScreen({super.key});

  @override
  ConsumerState<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends ConsumerState<NoteAddScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nueva nota"),
        backgroundColor: const Color.fromARGB(255, 169, 72, 37),
        centerTitle: true,
      ),
      body: TextField(
        controller: textFieldController,
        decoration: const InputDecoration(
            hintText: "Introduce el texto de tu nueva nota"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => saveNote(),
        child: const Icon(Icons.save),
      ),
    );
  }

  saveNote() {
    Nota miNuevaNota = Nota(texto: textFieldController.text);

    ref.read(notasProvider.notifier).addNota(miNuevaNota);

    Navigator.of(context).pop();
  }
}
