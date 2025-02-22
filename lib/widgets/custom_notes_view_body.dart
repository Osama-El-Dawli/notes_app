import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/theme_cubit/theme_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  void toggleTheme() {
    context.read<ThemeCubit>().changeTheme();
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
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              IconData currentIcon =
                  state is ThemeDark ? Icons.brightness_6 : Icons.dark_mode;
              return CustomAppBar(
                title: 'Notes App',
                icon: currentIcon,
                onIconPressed: toggleTheme,
              );
            },
          ),
          const Expanded(
            child: NotesListView(),
          )
        ],
      ),
    );
  }
}
