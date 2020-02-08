import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pokedex/custom_clipper.dart';
import 'package:pokedex/pokemon.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

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
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      pokemons[index].name,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Text(
                              pokemons[index].name,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 4.0,
                                  left: 32.0,
                                  right: 4.0,
                                  bottom: 4.0),
                              child: Stack(
                                children: <Widget>[
                                  ClipPath(
                                    clipper: PokeballClipper(),
                                   
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/pokemon/" +
                                        pokemons[index]
                                            .id
                                            .toString()
                                            .padLeft(3, '0') +
                                        ".png",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
