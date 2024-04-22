import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mis_notas.dart';
import '../models/nota.dart';

class NotasNotifier extends StateNotifier<List<Nota>> {
  NotasNotifier() : super(misNotasDePrueba);

  addNota(Nota nuevaNota) {
    //Con los 3 puntos ... lo que hacemos es meter detro de la lista state
    ////la nueva nota mas lo que ya hubiera en state (las notas que ya tuviera)
    state = [nuevaNota, ...state];
  }

  deleteNota(String id) {
    //el metodo .where nos recorre todos los elementos de nuestra lista
    //a cada elemento lo llamamos notaAhora
    //se guarda en state TODOS los elementos cuo id sea diferente
    // que el que queremeos borrar

    state = state.where((notaAhora) => notaAhora.id != id).toList();
  }

  updateNota(Nota notaActualizada, String idNotaAntes) {
    state = state.map((notaAhora) {
      if (notaAhora.id == idNotaAntes) {
        return notaActualizada;
      }
      return notaAhora;
    }).toList();
  }
}

final notasProvider = StateNotifierProvider<NotasNotifier, List<Nota>>(
  (ref) => NotasNotifier(),
);
