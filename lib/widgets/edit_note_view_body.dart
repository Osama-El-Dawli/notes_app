import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/consts.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/cubits/theme_cubit/theme_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/colors_list_view.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note, this.onPressed});

  final NoteModel note;
  final void Function()? onPressed;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.subTitle);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomAppBar(
            onIconPressed: () {
              widget.note.title = titleController.text;
              widget.note.subTitle = contentController.text;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return CustomTextField(
                borderColor:
                    state is ThemeDark ? Colors.white : Colors.grey[800],
                controller: titleController,
                hintText: 'Title',
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return CustomTextField(
                borderColor:
                    state is ThemeDark ? Colors.white : Colors.grey[800],
                controller: contentController,
                hintText: 'Content',
                maxLines: null,
                minLines: 5,
              );
            },
          ),
          const SizedBox(
            height: 18,
          ),
          EditNoteColorList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = kColors[index].value;
              setState(() {});
            },
            child: ColorItem(
              color: kColors[index],
              isActive: currentIndex == index,
            ),
          ),
        ),
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
