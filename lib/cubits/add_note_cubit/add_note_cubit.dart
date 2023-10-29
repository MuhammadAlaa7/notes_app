import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../model/note.dart';
import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitialState());

  addNote(Note note) async {
    emit(AddNoteLoadingState());
    await  Future.delayed(const Duration(seconds: 1));   // you MUST AWAIT  for it 
    try {
      var notesBox = Hive.box<Note>('notes');
      await notesBox.add(note);
      emit(AddNoteSuccessState());
    } catch (error) {
      emit(AddNoteFailureState(error: error.toString()));
    }
  }
}
