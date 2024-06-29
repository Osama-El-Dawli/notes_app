import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_button.dart';
import 'package:notes/widgets/custom_text_field.dart';

class ShowModalBottomSheet extends StatelessWidget {
  const ShowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            CustomTextField(hintText: 'Title'),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: 'Content',
              maxLines: 5,
            ),
            SizedBox(
              height: 120,
            ),
            CustomButton(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
