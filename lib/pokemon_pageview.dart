import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';
import 'package:pokedex/pokemon_detail.dart';

class PokemonPageView extends StatefulWidget {
  final List<PokemonNew> pokemons;
  final int initialPage;
  PokemonPageView({this.pokemons, this.initialPage});

  @override
  _PokemonPageViewState createState() =>
      _PokemonPageViewState(pokemons: pokemons, initialPage: initialPage);
}

class _PokemonPageViewState extends State<PokemonPageView> {
  final List<PokemonNew> pokemons;
  final int initialPage;
  PageController controller;

  @override
  void initState(){
    super.initState();
    controller = PageController(initialPage: initialPage);
  }

  _PokemonPageViewState({this.pokemons, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller,
        itemBuilder: (context, position) {
          return PokemonDetails(pokemonNew: pokemons[position],);
        },
        pageSnapping: true,
        itemCount: pokemons.length,
        physics: BouncingScrollPhysics());
  }
}
