part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState extends Equatable {}

class PokemonInitial extends PokemonState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends PokemonState {
  @override
  List<Object> get props => [];
}

class SuccessState extends PokemonState {
  final List<PokemonModel> pokemon;
  SuccessState({
    required this.pokemon,
  });

  @override
  List<Object?> get props => [pokemon];
}

class ErrorState extends PokemonState {
  final String error;
  ErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
