import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_pokedex_app/common/widgets/loader.dart';
import 'package:pokemon_pokedex_app/data/repository/pokemon_repository.dart';
import 'package:pokemon_pokedex_app/features/home_screen/widgets/pokemon_card.dart';
import '../../../models/pokemon_model.dart';
import '../../../themes/bloc/theme_bloc.dart';
import '../bloc/pokemon_bloc.dart';
import '../widgets/pokedex_app_bar.dart';

class PokedexHomeScreen extends StatefulWidget {
  static const String routeName = "/pokedex-home-screen";
  const PokedexHomeScreen({super.key});

  @override
  State<PokedexHomeScreen> createState() => _PokedexHomeScreenState();
}

class _PokedexHomeScreenState extends State<PokedexHomeScreen> {
  bool isSwitch = false;
  final List<PokemonModel> pokemonList = [];

  _lightTheme(context) {
    BlocProvider.of<ThemeBloc>(context).add(LightAppThemeEvent());
  }

  _darckTheme(context) {
    BlocProvider.of<ThemeBloc>(context).add(DarkAppThemeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 120,
        title: const PokedexAppBarImageBox(),
        actions: [
          IconButton(
              onPressed: (() {
                setState(() {
                  isSwitch ? _lightTheme(context) : _darckTheme(context);
                  isSwitch = !isSwitch;
                });
              }),
              icon: !isSwitch
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode))
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            PokemonBloc(PokemonRepository())..add(LoadPokemonData()),
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is SuccessState) {
              pokemonList.addAll(state.pokemon);

              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: pokemonList.length,
                  itemBuilder: ((context, index) {
                    return PokemonCard(
                      pokemonList: pokemonList,
                      index: index,
                    );
                  }));
            }
            return Loader(
              color: Theme.of(context).primaryColor,
            );
          },
        ),
      ),
    );
  }
}
