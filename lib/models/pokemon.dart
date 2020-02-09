import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex/models/pokemon_color.dart';
import 'package:tuple/tuple.dart';

class Pokemon {
  final String name;
  final String id;
  final int pkdxId;
  final String description;
  final List<String> type;
  final DocumentReference reference;

  Widget image;
  Map<String, Color> color;

  Pokemon.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Pokemon.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        id = map['pkdx_id'].toString().padLeft(3, '0'),
        pkdxId = map['pkdx_id'],
        description = map['description'],
        type = List<String>.from(map['types']);

  set colors(int selected) {
    String type = this.type.length > 0
        ? this.type.elementAt(selected)
        : this.type.elementAt(0);
    Tuple2 colors = PokemonColor.getColor(type);
    color = {"primary": colors.item1, "secondary": colors.item2};
  }
}
