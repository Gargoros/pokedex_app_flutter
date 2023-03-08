// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:pokemon_pokedex_app/data/repository/pokemon_repository.dart';
import 'package:pokemon_pokedex_app/models/pokemon_model.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;
  List<PokemonModel> pokemonList = [];
  PokemonBloc(
    this.pokemonRepository,
  ) : super(PokemonInitial()) {
    on<LoadPokemonData>((event, emit) async {
      try {
        pokemonList = await pokemonRepository.getPokemonList();
        emit(SuccessState(pokemon: pokemonList));
      } catch (e) {
        emit(ErrorState(error: e.toString()));
      }
    });
  }
}
