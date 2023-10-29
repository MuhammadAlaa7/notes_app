import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/input_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

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
              ),
              SizedBox(
                height: 20,
              ),
              InputField(label: 'Title', hint: 'Enter note tilte to edit'),
              InputField(
                label: 'Content',
                hint: 'Enter note content to edit ',
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
