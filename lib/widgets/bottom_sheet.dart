import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'bottom_sheet_content.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        // this cubit is for bottom sheet only so create it here so if the bottom sheet close the cubit close 
        //and it is better for resources
          create: (context) => AddNoteCubit(),
        
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          // هنا بقوله انت هتزق من تحت بمقدار المساحه اللي هتاخدها ال كيبورد لما تتفتح ****************************
        ),
        child: BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: (context, state) {
            // Things need to be excuted are here

            if (state is AddNoteFailureState) {
              debugPrint('there is a failure ');
            } else if (state is AddNoteSuccessState) {
              Navigator.pop(context);
              BlocProvider.of<GetNotesCubit>(context).getAllNotes();
            }
          },
          builder: (context, state) {
            // Things need to be built are here.

            return BottomSheetContent();
          },
        ),
      ),
    );
  }
}
