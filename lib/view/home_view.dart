import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/widgets/no_notes.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/notes_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<GetNotesCubit, GetNotesStates>(
        // the screen must be wraped with the bloc builder to listen to the updates and rebuild it

        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocProvider.of<GetNotesCubit>(context).notes!.isEmpty
                  ? const NoNotes()
                  : Column(
                      children: [
                        CustomAppBar(
                          iconData: Icons.search,
                          onPressed: () {},
                        ),
                        const Expanded(
                          child: NoteItemsListView(),
                        ),
                      ],
                    ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return const AddNoteBottomSheet();
                  },
                );
              },
              child: const Icon(
                Icons.add,
              ),
            ),
          );
        },
      ),
    );
  }
}
