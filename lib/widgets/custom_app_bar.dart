import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onIconPressed});

  final String title;
  final IconData icon;
  final void Function()? onIconPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        CustomIcon(
          onPressed: onIconPressed,
          icon: icon,
        ),
      ],
    );
  }
}
