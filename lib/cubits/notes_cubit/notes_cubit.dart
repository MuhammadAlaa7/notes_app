import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../model/note.dart';
import 'notes_states.dart';

class GetNotesCubit extends Cubit<GetNotesStates> {
  //

  GetNotesCubit() : super(GetNotesInitialState());

  List<NoteModel>? notes;

  void getAllNotes() {
    //

    var notesBox = Hive.box<NoteModel>('notes');

    notes = notesBox.values.toList();

    emit(GetNoteSuccessfully());

    //
  }
}

/* 
             ------- Cubit steps  -----

1 - create the cubit states 
2 - create the cubit itself and call the super and make the method 
3 - provide the cubit in the place needs it 
4 - listen for that cubit provided 

*/ 
