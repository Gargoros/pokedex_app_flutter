import 'package:flutter/material.dart';
import 'package:pokemon_pokedex_app/constants/color_constants.dart';
import 'package:pokemon_pokedex_app/constants/style_constants.dart';

import '../../../models/pokemon_model.dart';

class PokemonTypeBox extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonTypeBox({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 90),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: pokemon.types!
            .map((Types types) => Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    types.type!.name.toString(),
                    style: typeTextStyle,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
