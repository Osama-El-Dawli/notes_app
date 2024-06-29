import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Notes App',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        CustomIcon(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 28,
          ),
        ),
      ],
    );
  }
}
