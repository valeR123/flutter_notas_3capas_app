import 'package:flutter/material.dart';
import 'package:flutter_notas_3capas_app/business/notes_bloc.dart';
import 'package:flutter_notas_3capas_app/data/note.dart';
import 'package:flutter_notas_3capas_app/presentation/add_note_page.dart';

class NotesPage extends StatefulWidget {
  final NotesBloc bloc;

  NotesPage({required this.bloc});

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: StreamBuilder<List<Note>>(
        stream: widget.bloc.notesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].description),
                );
              },
            );
          } else {
            return Center(
              child: Text('There are no notes'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNotePage(bloc: widget.bloc),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
