// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../common/widgets/error.dart';
import '../constants/text_constants.dart';
import '../features/details_screen/screens/pokedex_details_screen.dart';
import '../features/home_screen/screens/pokedex_home_screen.dart';
import '../models/pokemon_model.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case PokedexHomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const PokedexHomeScreen());
    case PokedexDetailScreen.routeName:
      final PokemonModel pokemonModel = routeSettings.arguments as PokemonModel;
      return MaterialPageRoute(
          builder: (context) => PokedexDetailScreen(
                pokemonModel: pokemonModel,
              ));

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(
            error: errorScreenText,
          ),
        ),
      );
  }
}
