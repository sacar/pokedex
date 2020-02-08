class PokemonNew {
  final String name;
  final int id;
  final String description;

  PokemonNew({this.name, this.id, this.description});

  factory PokemonNew.fromJson(json) {

    return new PokemonNew(
      name: json['name'],
      id: json['pkdx_id'],
      description: json['description']
      );
  }

}