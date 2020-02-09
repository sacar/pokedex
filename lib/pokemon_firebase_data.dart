import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/screens/homepage/widgets/gridTile_widget.dart';
import 'package:pokedex/widgets/image_widget.dart';

import 'models/pokemon.dart';

class PokemonGrid extends StatefulWidget {
  @override
  _PokemonGridState createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('pokemon').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: LinearProgressIndicator());

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildList(context, snapshot.data.documents),
        );
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshots) {
    return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 1.4,
        physics: BouncingScrollPhysics(),
        children: List.generate(snapshots.length, (index) {
          return _listItem(context, snapshots[index]);
        }));
  }

  Widget _listItem(BuildContext context, DocumentSnapshot snapshot) {
    final Pokemon pokemon = Pokemon.fromSnapshot(snapshot);
    pokemon.image = PokemonImage(pokedexId: pokemon.id);
    pokemon.colors = 0;
    return GridTile(child: PokemonGridTile(pokemon: pokemon));
  }
}
