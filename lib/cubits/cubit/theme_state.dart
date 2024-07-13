part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeLight extends ThemeState {}

final class ThemeDark extends ThemeState {}
