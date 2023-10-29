import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/model/note.dart';
import 'add_note_button.dart';
import 'input_field.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  String? title;

  String? subTitle;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  'Add Note',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 30),
              InputField(
                label: 'Title',
                hint: 'Enter the note title',
                onSaved: (value) {
                  title = value;
                },
              ),
              InputField(
                label: 'Content',
                hint: 'Enter the note content',
                maxLines: 5,
                onSaved: (value) {
                  subTitle = value;
                },
              ),
              const SizedBox(height: 20),
              AddNoteButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
              
                    var note = Note(
                      title: title!,
                      subTitle: subTitle!,
                      color: Colors.black.value,
                      date: DateTime.now().toString(),
                    );
              
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                        FocusScope.of(context).unfocus();  // dismiss the keyboard 
              
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                   setState(() {});
                  }
                },
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
