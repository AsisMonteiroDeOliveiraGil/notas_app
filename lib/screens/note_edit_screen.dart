import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/nota.dart';
import '../providers/notas_provider.dart';

class NoteEditScreen extends ConsumerStatefulWidget {
  final Nota nota;

  const NoteEditScreen({super.key, required this.nota});

  @override
  ConsumerState<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends ConsumerState<NoteEditScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    textFieldController.text = widget.nota.texto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar nota"),
        backgroundColor: const Color.fromARGB(255, 169, 72, 37),
        centerTitle: true,
      ),
      body: TextField(
        controller: textFieldController,
        decoration: const InputDecoration(
            hintText: "Introduce el texto de tu nueva nota"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => updateNote(),
        child: const Icon(Icons.save),
      ),
    );
  }

  updateNote() {
    Nota miNuevaNotaActualizada = Nota(texto: textFieldController.text);

    ref
        .read(notasProvider.notifier)
        .updateNota(miNuevaNotaActualizada, widget.nota.id);

    Navigator.of(context).pop();
  }
}
