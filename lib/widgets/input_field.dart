import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.label,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.isLabelFloating = true,
  });
  final String hint;
  final String? label;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final bool isLabelFloating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required ';
          }
          return null;
        },
        maxLines: maxLines,
        decoration: InputDecoration(
          label: Text(
            label ?? '',
            style: const TextStyle(
              color: kPrimaryColor,
            ),
          ),
          hintText: hint,
          enabledBorder: inputBorder(),
          border: inputBorder(),
          focusedBorder: inputBorder(kPrimaryColor),
          floatingLabelBehavior: isLabelFloating
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
        ),
      ),
    );
  }

  OutlineInputBorder inputBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
