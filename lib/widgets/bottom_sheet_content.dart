import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/widgets/colors_palette.dart';
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
// This is the default color if no color item was selected
  Color selectedColorFromColorItem = const  Color(0xfffb8500);

// There must be an even or action to receive the selected color from color item
//  دا المندوب الللي هيروح يجيب اللون المختار 

Color? receiveSelectedColor({Color? color}) {
  // this function neeeds to be triggered when the color item tapped
  
   setState(() {
    selectedColorFromColorItem = color!;
  });

  return selectedColorFromColorItem;
}



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
              const SizedBox(height: 10),
              BlocBuilder<AddNoteCubit, AddNoteStates>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
//  
                          // ههنا المندوب بيروح للمكان اللي فيه اللون عشان يجيبه 
                 ColorsListView( receivedSelectedColor:  receiveSelectedColor ),
//
                      AddNoteButton(
                        isLoading: state is AddNoteLoadingState ? true : false,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            var note = NoteModel(
                              title: title!,
                              subTitle: subTitle!,
                              color: selectedColorFromColorItem.value,
                              date: DateFormat.yMMMMd().format(DateTime.now()),
                            );

                            BlocProvider.of<AddNoteCubit>(context)
                                .addNote(note);
                            FocusScope.of(context)
                                .unfocus(); // dismiss the keyboard
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
