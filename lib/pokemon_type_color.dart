import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class PokemonTypeColor {
  Tuple2<Color, Color> normal = Tuple2(Color(0xffb3bbbd), Color(0xffd4d6d6));
  Tuple2<Color, Color> dragon = Tuple2(Color(0xff1285d9), Color(0xff1993e7));
  Tuple2<Color, Color> fire = Tuple2(Color(0xfffb9b51), Color(0xffffa954));
  Tuple2<Color, Color> electric = Tuple2(Color(0xffedd63e), Color(0xfff2ef7b));
  Tuple2<Color, Color> poison = Tuple2(Color(0xffc272da), Color(0xffd49ae5));
  Tuple2<Color, Color> fighting = Tuple2(Color(0xffe2434e), Color(0xffe69297));
  Tuple2<Color, Color> ground = Tuple2(Color(0xffe18b65), Color(0xffe9aa90));
  Tuple2<Color, Color> ghost = Tuple2(Color(0xff7084ba), Color(0xff5169ac));
  Tuple2<Color, Color> water = Tuple2(Color(0xff6EB5F8), Color(0xff96cafb));
  Tuple2<Color, Color> psychic = Tuple2(Color(0xfff87c7a), Color(0xfffda1a0));
  Tuple2<Color, Color> dark = Tuple2(Color(0xff595761), Color(0xff6d6a75));
  Tuple2<Color, Color> flying = Tuple2(Color(0xff90A7DA), Color(0xffbdcae9));
  Tuple2<Color, Color> bug = Tuple2(Color(0xffa1c64f), Color(0xffb3d070));
  Tuple2<Color, Color> rock = Tuple2(Color(0xffcec18c), Color(0xffebe6d1));
  Tuple2<Color, Color> steel = Tuple2(Color(0xff5596a4), Color(0xff5eabbe));
  Tuple2<Color, Color> ice = Tuple2(Color(0xff70ccbd), Color(0xffaae0d7));
  Tuple2<Color, Color> fairy = Tuple2(Color(0xffec8ce6), Color(0xfff3bcef));
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
      case "water":
        return water;
      default:
        return grass;
    }
  }
}
