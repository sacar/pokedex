import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class PokemonTypeColor {
  Tuple2<Color, Color> normal = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> dragon = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> fire = Tuple2(Color(0xffFC6C6D), Color(0xffff9796));
  Tuple2<Color, Color> electric = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> poison = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> fighting = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> ground = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> ghost = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> water = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> psychic = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> dark = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> flying = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> bug = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> rock = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> steel = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> ice = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> fairy = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));
  Tuple2<Color, Color> grass = Tuple2(Color(0xff49d0b0), Color(0xff72dac2));

  Tuple2<Color, Color> getColor(String type) {
    switch (type) {
      case "normal":
        return normal;
      case "dragon":
        return dragon;
      case "fire":
        return fire;
      case "electric":
        return electric;
      case "poison":
        return poison;
      case "fighting":
        return fighting;
      case "ground":
        return ground;
      case "ghost":
        return ghost;
      case "psychic":
        return psychic;
      case "dark":
        return dark;
      case "flying":
        return flying;
      case "bug":
        return bug;
      case "rock":
        return rock;
      case "steel":
        return steel;
      case "ice":
        return ice;
      case "fairy":
        return fairy;
      case "grass":
        return grass;
      default:
        return grass;
    }
  }
}
