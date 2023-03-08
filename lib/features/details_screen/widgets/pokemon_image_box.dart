// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokemon_pokedex_app/constants/color_constants.dart';

import '../../../constants/style_constants.dart';
import '../../../models/pokemon_model.dart';

class PokemonImageBox extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonImageBox({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Stack(clipBehavior: Clip.none, children: [
        Positioned(
          child: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: whiteYellow,
              size: 55,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          bottom: -130,
          child: Image.network(
            pokemon.sprites!.other!.officialArtwork!.frontDefault!,
            scale: 1.3,
          ),
        ),
        Positioned(
          top: 10,
          right: 15,
          child: Text(pokemon.name.toString(), style: pokemonNameStyle),
        ),
      ]),
    );
  }
}
