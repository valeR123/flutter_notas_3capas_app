import 'package:flutter/material.dart';
import 'package:flutter_notas_3capas_app/business/notes_bloc.dart';
import 'package:flutter_notas_3capas_app/data/notes_repository.dart';
import 'package:flutter_notas_3capas_app/presentation/notes_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotesRepository repository = NotesRepository();
    final NotesBloc bloc = NotesBloc(repository: repository);

    return MaterialApp(
      key: const Key('material_app'),
      title: 'Notas Xiaomi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NotesPage(bloc: bloc),
    );
  }
}
