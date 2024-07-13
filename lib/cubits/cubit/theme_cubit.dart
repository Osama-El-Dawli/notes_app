import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeDark());

  void changeTheme() {
    if (state is ThemeDark) {
      emit(ThemeLight());
    } else {
      emit(ThemeDark());
    }
  }
}
