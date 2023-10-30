import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  final IconData iconData;
  final void Function()? onPressed ; 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Notes',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            iconSize: 30,
            splashRadius: 28,
            icon: Icon(
              iconData,
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
