import 'package:flutter/material.dart';
import 'package:pokedex/utils/custom_clipper.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/type_chip.dart';

class PokemonGridTile extends StatelessWidget {
  final Pokemon pokemon;

  PokemonGridTile({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: pokemon.color['primary'],
            borderRadius: BorderRadius.circular(16),
          ),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _pokemonName(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _pokemonType(),
                SizedBox(
                  width: 5,
                ),
                _pokemonImage(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _pokemonName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          pokemon.name,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Text(
          "#" + pokemon.id,
          style: TextStyle(fontSize: 24, color: Colors.white),
        )
      ],
    );
  }

  Widget _pokemonType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: pokemon.type.map<Widget>((type) {
        return PokemonTypeChip(
          type: type,
          background: pokemon.color['secondary'],
        );
      }).toList(),
    );
  }

  Widget _pokemonImage() {
    return Expanded(
      flex: 1,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            painter: ShapesPainter(
                main: pokemon.color['primary'], pokeball: pokemon.color['secondary']),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: pokemon.image,
          ),
        ],
      ),
    );
  }
}
