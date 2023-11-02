import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
    required this.onPressed,
    this.isLoading = false  , 
  });
    final bool isLoading ; 
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: isLoading ? const SizedBox(
        height: 10,
        width: 10,
        child:  CircularProgressIndicator(
          color: Colors.black,
         
        ),
      ) : const  Text(
        'Add',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
