import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_text_field.dart';

class ShowModalBottomSheet extends StatelessWidget {
  const ShowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(),
        ),
      ],
    );
  }
}
