import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:pokemon_pokedex_app/data/repository/pokemon_repository.dart';
import 'package:pokemon_pokedex_app/models/pokemon_model.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailInfoBloc
    extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final PokemonRepository pokemonRepository;

  PokemonDetailInfoBloc(
    this.pokemonRepository,
  ) : super(DetailInitial()) {
    on<DetailLoadPokemonData>((event, emit) async {
      try {
        final PokemonModel pokemon =
            await pokemonRepository.getPokemonDetail(event.id);
        emit(DetailSuccessState(pokemon: pokemon));
      } catch (e) {
        emit(DetailErrorState(error: e.toString()));
      }
    });
  }
}
