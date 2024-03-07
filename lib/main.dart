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
      title: 'Notas Xiaomi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFF4F4F4),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: NotesPage(bloc: bloc), // Aquí se pasa el bloc creado al constructor de NotesPage
    );
  }
}
