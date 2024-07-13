import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void changeTheme() {
    if (state is ThemeDark) {
      emit(ThemeLight());
    } else if (state is ThemeLight) {
      emit(ThemeDark());
    }
  }

  void initializeTheme(Brightness brightness) {
    if (brightness == Brightness.dark) {
      emit(ThemeDark());
    } else {
      emit(ThemeLight());
    }
  }
}
