import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class PokemonTypeWidgetCircular extends StatelessWidget {
  final Tuple2 type;
  final double radius;

  PokemonTypeWidgetCircular(this.type, this.radius);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: type.item2,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Image.asset("images/" + type.item1 + ".png"),
      ),
    );
  }
}
