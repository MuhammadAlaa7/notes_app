import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../model/note.dart';
import 'notes_states.dart';

class GetNotesCubit extends Cubit<GetNotesStates> {
  GetNotesCubit() : super(GetNotesInitialState());

List<Note>? notes ;

  void getAllNotes() {
    var notesBox = Hive.box<Note>('notes');

     notes = notesBox.values.toList();

     emit(GetNoteSuccessfully());
  //   log('the note has been added');
     print('the note has been added============================================================****');
   
  }
}

/* 
             ------- Cubit steps  -----

1 - create the cubit states 
2 - create the cubit itself and call the super and make the method 
3 - provide the cubit in the place needs it 
4 - listen for that cubit provided 

*/ 
