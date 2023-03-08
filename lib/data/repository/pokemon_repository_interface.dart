import '../../models/pokemon_model.dart';

abstract class PokemonRepositoryInterface {
  Future<List<PokemonModel>> getPokemonList();
  Future<PokemonModel> getPokemon(String name);
  Future<PokemonModel> getPokemonDetail(int id);
}
