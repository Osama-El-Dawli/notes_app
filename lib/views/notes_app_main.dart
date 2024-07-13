import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/theme_cubit/theme_cubit.dart';
import 'package:notes/views/notes_view.dart';

class NotesAppView extends StatefulWidget {
  const NotesAppView({super.key});

  @override
  State<NotesAppView> createState() => _NotesAppViewState();
}

class _NotesAppViewState extends State<NotesAppView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final brightness = MediaQuery.of(context).platformBrightness;
      BlocProvider.of<ThemeCubit>(context).initializeTheme(brightness);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: state is ThemeDark ? Brightness.dark : Brightness.light,
            fontFamily: 'Poppins',
          ),
          home: const NotesView(),
        );
      },
    );
  }
}
