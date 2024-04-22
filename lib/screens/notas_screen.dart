import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/nota.dart';
import '../providers/notas_provider.dart';
import 'note_add_screen.dart';
import 'note_edit_screen.dart';

class NotasScreen extends ConsumerStatefulWidget {
  const NotasScreen({super.key});

  @override
  ConsumerState<NotasScreen> createState() => _NotasScreenState();
}

class _NotasScreenState extends ConsumerState<NotasScreen> {
  @override
  Widget build(BuildContext context) {
    //Con Watch lo que hacemos es escuchar para siempre cualquier cambio
    //en el state del provider
    //Cualquier cambio que e prouzca en el el state del provider hara
    //que se ejecute de nuevo este build y por lo tanto se actualice la pantalla

    final miListaDeNotas = ref.watch(notasProvider);
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi app de notas"),
        backgroundColor: const Color.fromARGB(255, 169, 72, 37),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) => Card(
                child: ListTile(
                  title: Text(
                    miListaDeNotas[index].texto,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    onPressed: () => deleteNote(miListaDeNotas[index].id),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () => openEditScreen(context, miListaDeNotas[index]),
                ),
              ),
          itemCount: miListaDeNotas.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openAddScreen(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void openAddScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NoteAddScreen()));
  }

  void openEditScreen(BuildContext context, Nota notaSeleccionada) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => NoteEditScreen(nota: notaSeleccionada)));
  }

  void deleteNote(String idNotaAEliminar) {
    ref.read(notasProvider.notifier).deleteNota(idNotaAEliminar);
  }
}
