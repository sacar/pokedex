import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class PokemonWeakness extends StatelessWidget {
  static const normal =
      Tuple3<String, String, Color>("normal", "1", Color(0xFF9A9DA1));
  static const dragon =
      Tuple3<String, String, Color>("dragon", "1", Color(0xFF0773C7));
  static const fire =
      Tuple3<String, String, Color>("fire", "1/2", Color(0xFFF8A54F));
  static const electric =
      Tuple3<String, String, Color>("electric", "1",Color(0xFFEDD53F));
  static const poison =
      Tuple3<String, String, Color>("poison", "1", Color(0xFFB563CE));
  static const fighting =
      Tuple3<String, String, Color>("fighting", "1", Color(0xFFD94256));
  static const ground =
      Tuple3<String, String, Color>("ground", "2",Color(0xFFD78555));
  static const ghost =
      Tuple3<String, String, Color>("ghost", "2", Color(0xFF6970C5));
  static const water =
      Tuple3<String, String, Color>("water", "1", Color(0xFF559EDF));
  static const psychic =
      Tuple3<String, String, Color>("psychic", "1",Color(0xFFF87C7A));
  static const dark =
      Tuple3<String, String, Color>("dark", "1", Color(0xFF5F606D));
  static const flying =
      Tuple3<String, String, Color>("flying", "1", Color(0xFF9BB4E8));
  static const bug =
      Tuple3<String, String, Color>("bug", "1/2", Color(0xFF9DC130));
  static const rock =
      Tuple3<String, String, Color>("rock", "2", Color(0xFFCEC18C));

  static const steel =
      Tuple3<String, String, Color>("steel", "1/2", Color(0xFF5596A4));
  static const grass =
      Tuple3<String, String, Color>("grass", "1/2", Color(0xFF5DBE62));

  static const ice =
      Tuple3<String, String, Color>("ice", "1/2", Color(0xFF7ED4C9));

  static const fairy =
      Tuple3<String, String, Color>("fairy", "1/2", Color(0xFFEF97E6));

  final List<List<Tuple3>> weaknesses = [
    [normal, dragon, fire, poison, bug, electric],
    [fighting, ground, ghost, water, psychic, dark],
    [flying, rock, steel, grass, ice, fairy],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_title(), _weaknessPerType()],
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Weaknesses",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }

  Widget _weaknessPerType() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: weaknesses
              .map<Widget>((weaknessList) => _singleColumnofType(weaknessList))
              .toList()),
    );
  }

  Widget _singleColumnofType(List<Tuple3> weaknesses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: weaknesses.map<Widget>((type) => _typeSymbol(type)).toList());
  }

  Widget _typeSymbol(Tuple3 type) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right : 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: type.item3,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset("assets/images/types/" + type.item1 + ".png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only( right: 16.0),
            child: Text(
              type.item2 + "x",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
