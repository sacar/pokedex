import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pokedex/custom_clipper.dart';
import 'package:pokedex/pokemon.dart';
import 'package:pokedex/pokemon_type_color.dart';

class PokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadPokemon(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _gridViewPokemon(snapshot.data);
          } else {
            return new CircularPercentIndicator(
              radius: 2,
            );
          }
        },
      ),
    );
  }

  Widget _list(List<PokemonNew> pokemons) {
    return ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/pokemon/" +
                  pokemons[index].id.toString().padLeft(3, '0') +
                  ".png"),
            ),
            title: Text(pokemons[index].name),
            subtitle: Text("#" + pokemons[index].id.toString()),
          );
        });
  }

  Widget _gridViewPokemon(List<PokemonNew> pokemons) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 1.4,
        children: List.generate(pokemons.length, (index) {
          Color primaryColor = PokemonTypeColor()
                    .getColor(pokemons[index].types.elementAt(0))
                    .item1;
          Color secondaryColor = PokemonTypeColor()
                    .getColor(pokemons[index].types.elementAt(0))
                    .item2;
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      pokemons[index].name,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  pokemons[index].types.map<Widget>((type) {
                                return _pokemonType(type, secondaryColor);
                              }).toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: <Widget>[
                              CustomPaint(
                                painter: ShapesPainter(
                                    main: primaryColor, pokeball: secondaryColor),
                                child: Container(
                                    // color:  Colors.redAccent,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/pokemon/" +
                                      pokemons[index]
                                          .id
                                          .toString()
                                          .padLeft(3, '0') +
                                      ".png",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _pokemonType(String type, Color background) {
    return Chip(
      avatar: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.transparent,
          child: Image.asset('assets/images/types/$type.png')),
      backgroundColor: background,
      // padding: EdgeInsets.only(left: 4, right: 4),
      label: Text(
        type.isNotEmpty ? type[0].toUpperCase() + type.substring(1) : type,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

Future<String> _loadPokemonAsset() async {
  return await rootBundle.loadString('assets/json/pokemon.json');
}

Future<List<PokemonNew>> loadPokemon() async {
  String jsonString = await _loadPokemonAsset();
  if (jsonString.isEmpty) {}
  List<dynamic> jsonResponse = jsonDecode(jsonString)['pokemon'] as List;

  // jsonResponse.forEach((json) => print(json['name']));

  List<PokemonNew> result =
      jsonResponse.map((json) => PokemonNew.fromJson(json)).toList();

  return result;
}
