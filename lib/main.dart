import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/bloc_observer.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/model/note.dart';

import 'view/home_view.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  // here I register the type of object i will store by its adapter
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes'); // here we open a box into database hive
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
          //canvasColor: Colors.transparent,
        ),
        home: const HomeView(),
      ),
    );
  }
}
