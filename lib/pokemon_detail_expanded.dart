import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:pokedex/nested_tab_bar.dart';

import 'custom_clipper.dart';

class PokemonDetailsExpanded extends StatefulWidget {
  @override
  _PokemonDetailsExpandedState createState() => _PokemonDetailsExpandedState();
}

class _PokemonDetailsExpandedState extends State<PokemonDetailsExpanded> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8A54F),
        elevation: 0,
        // leading: Icon(
        //   Icons.chevron_left,
        //   size: 30,
        // ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(8.0, 14.0, 12.0, 8.0),
            child: Text(
              "#005",
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
                color: Color(0xFFF8A54F),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: _pokemonImage(),
                    ),
                    _pokemonName(),
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

  Widget _pokemonImage() {
    return Center(
      // child: SvgPicture.asset('images/5.svg'),
      child: Hero(
        tag: 'pokemon',
        child: Image.asset('assets/images/pokemon/005.png'),
      ),
    );
  }

  Widget _pokemonName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Charmeleon",
        style: TextStyle(
            fontSize: 36, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
