// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_pokedex_app/common/widgets/loader.dart';
import 'package:pokemon_pokedex_app/data/repository/pokemon_repository.dart';
import 'package:pokemon_pokedex_app/features/details_screen/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_pokedex_app/features/details_screen/widgets/pokemon_characteristic_box.dart';
import 'package:pokemon_pokedex_app/features/details_screen/widgets/pokemon_image_box.dart';
import 'package:pokemon_pokedex_app/features/details_screen/widgets/pokemon_type_box.dart';

import '../../../models/pokemon_model.dart';

class PokedexDetailScreen extends StatefulWidget {
  static const String routeName = "/pokedex-details-screen";
  final PokemonModel pokemonModel;

  const PokedexDetailScreen({
    Key? key,
    required this.pokemonModel,
  }) : super(key: key);

  @override
  State<PokedexDetailScreen> createState() => _PokedexDetailScreenState();
}

class _PokedexDetailScreenState extends State<PokedexDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon = widget.pokemonModel;
    return Scaffold(
        body: BlocProvider(
      create: (context) => PokemonDetailInfoBloc(PokemonRepository())
        ..add(DetailLoadPokemonData(id: pokemon.id!)),
      child:
          Scaffold(body: BlocBuilder<PokemonDetailInfoBloc, PokemonDetailState>(
        builder: (context, state) {
          if (state is DetailSuccessState) {
            return Column(
              children: [
                PokemonImageBox(pokemon: pokemon),
                Column(
                  children: [
                    PokemonTypeBox(pokemon: pokemon),
                    PokemonCharacteristicBox(pokemon: pokemon),
                  ],
                )
              ],
            );
          }
          return Loader(color: Theme.of(context).primaryColor);
        },
      )),
    ));
  }
}
