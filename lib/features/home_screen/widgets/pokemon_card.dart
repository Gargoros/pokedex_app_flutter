// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokemon_pokedex_app/models/pokemon_model.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/style_constants.dart';
import '../../../constants/text_constants.dart';
import '../../details_screen/screens/pokedex_details_screen.dart';

class PokemonCard extends StatelessWidget {
  final List<PokemonModel> pokemonList;
  final int index;
  const PokemonCard({
    Key? key,
    required this.pokemonList,
    required this.index,
  }) : super(key: key);

  void navigateToDetailScreen(BuildContext context) {
    Navigator.pushNamed(context, PokedexDetailScreen.routeName,
        arguments: pokemonList[index]);
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = pokemonList[index];
    return InkWell(
      focusColor: groundColor,
      borderRadius: BorderRadius.circular(20),
      onTap: (() => navigateToDetailScreen(context)),
      child: Card(
        elevation: 12,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 10,
              child: Text(
                "#${pokemon.id}",
                style: idCardStyle,
              ),
            ),
            Positioned(
              top: -50,
              right: -50,
              child: Image.asset(
                pokemonCardImage,
                color: greyBackImage,
                scale: 3.8,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Text(
                "${pokemon.name}",
                style: pokemonNameCard,
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 0,
              right: -5,
              child: Image.network(
                "${pokemon.sprites!.other!.officialArtwork!.frontDefault}",
                scale: 3.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
