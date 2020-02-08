import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';
import 'package:pokedex/pokemon_detail_expanded.dart';
import 'package:pokedex/pokemon_type_color.dart';

import 'custom_clipper.dart';
import 'nested_tab_bar.dart';

class PokemonDetails extends StatelessWidget {
  final pokemonNew;

  PokemonDetails({this.pokemonNew});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy < 0) {
          //swipping up
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PokemonDetailsExpanded(pokemon: pokemonNew,)));
        }
      },
      child: Stack(
        children: <Widget>[
          Container(color: Colors.white),
          ClipPath(
            child: Container(
              color: PokemonTypeColor()
                  .getColor(pokemonNew.types.elementAt(0))
                  .item1,
            ),
            clipper: ObliqueLineClipper(),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 14.0, 12.0, 8.0),
                  child: Text(
                    "#" + pokemonNew.id.toString().padLeft(3, '0'),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 100, right: 100),
                    child: Hero(
                      tag: pokemonNew.name,
                      child: Image.asset('assets/images/pokemon/' +
                          pokemonNew.id.toString().padLeft(3, '0') +
                          '.png'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: <Widget>[
                        _pokemonName(pokemonNew.name),
                        _pokemonType(pokemonNew.types),
                        _pokemonDescription(pokemonNew.description),
                        // _divider(context),
                        Expanded(
                          child: Container(child: NestedTabBar()),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _pokemonName(String name) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _pokemonType(List<String> types) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: types.map<Widget>((type) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal : 8.0),
          child: Chip(
            avatar: Image.asset('assets/images/types/$type.png'),
            backgroundColor:  PokemonTypeColor()
                    .getColor(type)
                    .item1,
            padding: EdgeInsets.only(left: 6, right: 6),
            label: Text(
              type.isNotEmpty ? type[0].toUpperCase() + type.substring(1) : type,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _pokemonDescription(String description) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        description,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(child: Divider()),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PokemonDetailsExpanded()));
          },
          icon: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.arrow_drop_up,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: Divider(),
      ),
    ]);
  }
}
