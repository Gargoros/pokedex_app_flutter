part of 'pokemon_detail_bloc.dart';

@immutable
abstract class PokemonDetailState extends Equatable {}

class DetailInitial extends PokemonDetailState {
  @override
  List<Object?> get props => [];
}

class DetailLoadingState extends PokemonDetailState {
  @override
  List<Object> get props => [];
}

class DetailSuccessState extends PokemonDetailState {
  final PokemonModel pokemon;
  DetailSuccessState({
    required this.pokemon,
  });

  @override
  List<Object?> get props => [pokemon];
}

class DetailErrorState extends PokemonDetailState {
  final String error;
  DetailErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
