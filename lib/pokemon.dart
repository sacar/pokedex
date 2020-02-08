class PokemonNew {
  final String name;
  final int id;
  final String description;
  final List<String> types;

  PokemonNew({this.name, this.id, this.description, this.types});

  factory PokemonNew.fromJson(json) {
    List<dynamic> type = json['types'];

    return new PokemonNew(
      name: json['name'],
      id: json['pkdx_id'],
      description: json['description'],
      types: new List<String>.from(type),
      );
  }

}