import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_notas_3capas_app/data/note.dart';

class NotesRepository {
  final FirebaseFirestore _firestore;

  NotesRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<List<Note>> getAllNotes() async {
    final snapshot = await _firestore.collection('notes').get();
    return snapshot.docs.map((doc) {
      return Note(
        title: doc['title'],
        description: doc['description'],
      );
    }).toList();
  }

  Future<void> addNote(Note note) async {
    await _firestore.collection('notes').add({
      'title': note.title,
      'description': note.description,
    });
  }
}
