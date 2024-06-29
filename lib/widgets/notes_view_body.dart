import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/note_item.dart';
import 'package:notes/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          // SizedBox(
          //   height: 40,
          // ),
          CustomAppBar(),
          Expanded(
            child: NotesListView(),
          )
        ],
      ),
    );
  }
}
