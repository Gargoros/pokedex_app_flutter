part of 'pokemon_detail_bloc.dart';

@immutable
abstract class PokemonDetailEvent extends Equatable {}

class DetailLoadPokemonData extends PokemonDetailEvent {
  final int id;
  DetailLoadPokemonData({
    required this.id,
  });
  @override
  List<Object?> get props => [];
}
