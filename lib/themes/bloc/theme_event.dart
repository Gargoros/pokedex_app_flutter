part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {
  ThemeData getTheme();
}

class DarkAppThemeEvent extends ThemeEvent {
  final ThemeData themeData = darkTheme;

  @override
  ThemeData getTheme() {
    return themeData;
  }
}

class LightAppThemeEvent extends ThemeEvent {
  final ThemeData themeData = lightTheme;

  @override
  ThemeData getTheme() {
    return themeData;
  }
}
