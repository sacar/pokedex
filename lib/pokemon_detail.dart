import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_detail_expanded.dart';

import 'custom_clipper.dart';
import 'nested_tab_bar.dart';

class PokemonDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy < 0) {
          //swipping up
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PokemonDetailsExpanded()));
        }
      },
      child: Stack(
        children: <Widget>[
          Container(color: Colors.white),
          ClipPath(
            child: Container(
              color: Color(0xFFF8A54F),
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
                    "#006",
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
                      tag: 'pokemon',
                      child: Image.asset('assets/images/pokemon/005.png'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: <Widget>[
                        _pokemonName(),
                        _pokemonType(),
                        _pokemonDescription(),
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

  Widget _pokemonName() {
    return Text(
      "Charmeleon",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _pokemonType() {
    return Chip(
      avatar: Image.asset('assets/images/types/fire.png'),
      backgroundColor: Color(0xFFfd7d24),
      padding: EdgeInsets.only(left: 6, right: 6),
      label: Text(
        'Fire',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _pokemonDescription() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        "Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.",
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
