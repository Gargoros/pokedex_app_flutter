import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_pokedex_app/themes/bloc/theme_state.dart';
import 'package:pokemon_pokedex_app/themes/theme_data.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, SwitchThemeState> {
  ThemeBloc() : super(SwitchThemeState(lightTheme)) {
    on<LightAppThemeEvent>(
        (event, emit) => emit(SwitchThemeState(event.getTheme())));

    on<DarkAppThemeEvent>(
        (event, emit) => emit(SwitchThemeState(event.getTheme())));
  }
}
