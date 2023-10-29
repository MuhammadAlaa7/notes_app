import 'package:flutter/material.dart';

import 'note_item.dart';

class NoteItemsListView extends StatelessWidget {
  const NoteItemsListView({super.key});
  final List notes = const [
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return notes[index];
        },
        itemCount: notes.length,
      ),
    );
  }
}
