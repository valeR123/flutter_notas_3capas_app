import 'package:flutter/material.dart';
import 'package:flutter_notas_3capas_app/business/notes_bloc.dart';
import 'package:flutter_notas_3capas_app/data/notes_repository.dart';
import 'package:flutter_notas_3capas_app/presentation/notes_page.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa Firebase Core
import 'package:cloud_firestore/cloud_firestore.dart'; // Importa Firestore

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final NotesRepository repository = NotesRepository(firestore: firestore);
  final NotesBloc bloc = NotesBloc(repository: repository);

  runApp(MyApp(bloc: bloc));
}

class MyApp extends StatelessWidget {
  final NotesBloc bloc;

  const MyApp({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas',
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
      home: NotesPage(bloc: bloc),
    );
  }
}
