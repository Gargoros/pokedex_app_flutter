// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokemon_pokedex_app/constants/text_constants.dart';
import 'package:pokemon_pokedex_app/features/details_screen/widgets/pokemon_type_box.dart';

import '../../../constants/style_constants.dart';
import '../../../models/pokemon_model.dart';

class PokemonCharacteristicBox extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCharacteristicBox({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    children: const [
                      RotatedBox(
                          quarterTurns: 5,
                          child: Icon(Icons.straighten, size: 70)),
                      Text(heightText, style: heightTextStyle),
                    ],
                  ),
                  Text(
                    "${pokemon.height! * 10}" "$cmText",
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "${double.parse((pokemon.weight!).toStringAsFixed(2))}"
                    "$kgText",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Column(
                    children: const [
                      Icon(Icons.scale, size: 70),
                      Text(
                        weightText,
                        style: weightTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
