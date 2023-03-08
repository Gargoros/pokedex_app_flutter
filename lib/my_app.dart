import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_pokedex_app/constants/text_constants.dart';
import 'package:pokemon_pokedex_app/data/repository/pokemon_repository.dart';
import 'package:pokemon_pokedex_app/features/details_screen/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_pokedex_app/features/landing/screens/landing_screen.dart';

import 'package:pokemon_pokedex_app/router/router.dart';
import 'package:pokemon_pokedex_app/themes/bloc/theme_bloc.dart';
import 'package:pokemon_pokedex_app/themes/bloc/theme_state.dart';

import 'features/home_screen/bloc/pokemon_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeBloc()),
          BlocProvider(create: (context) => PokemonBloc(PokemonRepository())),
          BlocProvider(
              create: (context) => PokemonDetailInfoBloc(PokemonRepository())),
        ],
        child: BlocBuilder<ThemeBloc, SwitchThemeState>(
            builder: ((context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: appNameText,
              theme: state.themeData,
              onGenerateRoute: (settings) => generateRoute(settings),
              home: const LandingScreen());
        })));
  }
}
