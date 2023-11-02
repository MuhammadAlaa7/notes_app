import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/model/note.dart';

import 'note_item.dart';

class NoteItemsListView extends StatelessWidget {
  const NoteItemsListView({super.key});
  // final List notes = const [
  //   NoteItem(),
  //   NoteItem(),
  //   NoteItem(),
  //   NoteItem(),
  //   NoteItem(),
  //   NoteItem(),
  // ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesStates>(
      builder: (context, state) {
      List<NoteModel> notes = BlocProvider.of<GetNotesCubit>(context).notes ?? [] ;   // receiving the list
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return NoteItem(note: notes[index],);
            },
            itemCount: notes.length,
          ),
        );
      },
    );
  }
}
