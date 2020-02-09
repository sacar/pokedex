import 'package:flutter/material.dart';

class PokemonTypeChip extends StatelessWidget {
  final String type;
  final Color background;
  PokemonTypeChip({this.type, this.background});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.transparent,
          child: Image.asset('assets/images/types/$type.png')),
      backgroundColor: background,
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
