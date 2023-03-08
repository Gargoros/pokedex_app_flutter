import 'package:dio/dio.dart';
import 'package:pokemon_pokedex_app/data/repository/pokemon_repository_interface.dart';
import 'package:pokemon_pokedex_app/models/results_model.dart';

import '../../models/pokemon_model.dart';

class PokemonRepository extends PokemonRepositoryInterface {
  static final Dio dio = Dio();
  static const _baseApi = "https://pokeapi.co/api/v2/pokemon";

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    try {
      Response response = await dio.get("$_baseApi?limit=100&offset=0");
      List pokList = response.data["results"];
      List<Results> resultPokemon = pokList
          .map<Results>((resultPokemon) => Results.fromJson(resultPokemon))
          .toList();

      final pokemons = <PokemonModel>[];
      for (var pokemon in resultPokemon) {
        pokemons.add(await getPokemon(pokemon.name!));
      }
      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonModel> getPokemon(String name) async {
    try {
      Response response = await dio.get('$_baseApi/$name');
      final pokemonResponse = response.data;

      return PokemonModel.fromJson(pokemonResponse);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonModel> getPokemonDetail(int id) async {
    try {
      Response response = await dio.get('$_baseApi/$id');
      final pokemonSpecies = response.data;

      return PokemonModel.fromJson(pokemonSpecies);
    } catch (e) {
      rethrow;
    }
  }
}
