// presentation/add_note_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_notas_3capas_app/business/notes_bloc.dart';
import 'package:flutter_notas_3capas_app/data/note.dart';

class AddNotePage extends StatelessWidget {
  final NotesBloc bloc;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  AddNotePage({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                final description = _descriptionController.text;
                if (title.isNotEmpty && description.isNotEmpty) {
                  bloc.addNote(Note(
                    title: title,
                    description: description,
                  ));
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Por favor, complete todos los campos.')),
                  );
                }
              },
              child: Text('Add Notes'),
            ),
          ],
        ),
      ),
    );
  }
}
