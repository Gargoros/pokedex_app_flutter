part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent extends Equatable {}

class LoadPokemonData extends PokemonEvent {
  @override
  List<Object?> get props => [];
}
