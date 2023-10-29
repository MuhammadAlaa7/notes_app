import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.hint,
    this.maxLines = 1, this.onSaved,
  });
  final String label, hint;
  final int maxLines;
  final void Function(String?)? onSaved ; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: onSaved , 
        validator: (value) {
              if( value?.isEmpty ?? true ) {
                return 'Field is required '; 
              }
             return null ; 
        },
        maxLines: maxLines,
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(
              color: kPrimaryColor,
            ),
          ),
          hintText: hint,
          enabledBorder: inputBorder(),
          border: inputBorder(),
          focusedBorder: inputBorder(kPrimaryColor),
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
