import 'dart:async';
import 'package:flutter_notas_3capas_app/data/note.dart';
import 'package:flutter_notas_3capas_app/data/notes_repository.dart';

class NotesBloc {
  final NotesRepository _repository;
  final _notesStreamController = StreamController<List<Note>>.broadcast();

  Stream<List<Note>> get notesStream => _notesStreamController.stream;

  NotesBloc({required NotesRepository repository}) : _repository = repository {
    _loadNotes();
  }

  void _loadNotes() async {
    final notes = await _repository.getAllNotes();
    _notesStreamController.add(notes);
  }

  void addNote(Note note) {
    _repository.addNote(note);
    _loadNotes();
  }

  void dispose() {
    _notesStreamController.close();
  }
}
