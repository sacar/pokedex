import 'package:flutter/material.dart';

import 'package:pokedex/nested_tab_bar.dart';
import 'package:pokedex/pokemon.dart';
import 'package:pokedex/pokemon_type_color.dart';

class PokemonDetailsExpanded extends StatefulWidget {
  final PokemonNew pokemon;
  PokemonDetailsExpanded({this.pokemon});
  @override
  _PokemonDetailsExpandedState createState() =>
      _PokemonDetailsExpandedState(pokemon: pokemon);
}

class _PokemonDetailsExpandedState extends State<PokemonDetailsExpanded> {
  final PokemonNew pokemon;
  _PokemonDetailsExpandedState({this.pokemon});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            PokemonTypeColor().getColor(pokemon.types.elementAt(0)).item1,
        elevation: 0,
        // leading: Icon(
        //   Icons.chevron_left,
        //   size: 30,
        // ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(8.0, 14.0, 12.0, 8.0),
            child: Text(
              "#" + pokemon.id.toString().padLeft(3, '0'),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: screenHeight,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color:  PokemonTypeColor().getColor(pokemon.types.elementAt(0)).item1,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: _pokemonImage(pokemon.id,pokemon.name),
                    ),
                    _pokemonName(pokemon.name),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: NestedTabBar(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pokemonImage(int id, String name) {
    return Center(
      // child: SvgPicture.asset('images/5.svg'),
      child: Hero(
        tag: name,
        child: Image.asset('assets/images/pokemon/' +
            pokemon.id.toString().padLeft(3, '0') +
            '.png'),
      ),
    );
  }

  Widget _pokemonName(String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 36, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
