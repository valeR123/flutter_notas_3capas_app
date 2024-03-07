// data/notes_repository.dart

import 'package:flutter_notas_3capas_app/data/note.dart';

class NotesRepository {
  final List<Note> _notes = [];

  List<Note> getAllNotes() => List.from(_notes);

  void addNote(Note note) {
    _notes.add(note);
  }
}
