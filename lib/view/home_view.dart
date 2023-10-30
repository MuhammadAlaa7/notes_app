import 'package:flutter/material.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/notes_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(
                iconData: Icons.search,
                onPressed: (){} ,
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
      ),
    );
  }
}
