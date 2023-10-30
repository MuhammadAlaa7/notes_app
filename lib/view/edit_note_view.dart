import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/input_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  // this is for temporary storing until it is finally stored in the note itself
  String? title;
  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(
                iconData: Icons.check,
                onPressed: () {
                  // BEFORE YOU SAVE ==>  store the title you got into the title in the note and subtitle as well
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = subTitle ?? widget.note.subTitle;
                  // if it's null , put the last value it got

                  widget.note.save();
                  Navigator.pop(context);
                  BlocProvider.of<GetNotesCubit>(context).getAllNotes();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                label: widget.note.title,
                hint: '',
                isLabelFloating: false,
                onChanged: (value) {
                  title = value;
                },
              ),
              InputField(
                label: widget.note.subTitle,
                hint: '',
                maxLines: 5,
                isLabelFloating: false,
                onChanged: (value) {
                  subTitle = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
