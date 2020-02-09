import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PokemonImage extends StatelessWidget {
  final String pokedexId;
  PokemonImage({this.pokedexId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchImage(pokedexId),
      initialData: Icon(Icons.people),
      builder: (BuildContext context, AsyncSnapshot<Widget> image){
          return image.data;
      });

  }

  Future<Widget> _fetchImage( String id) async {
    final StorageReference reference = 
        FirebaseStorage.instance.ref().child("pokemon/$id.png");
    String location = await reference.getDownloadURL();
    return Image(image: NetworkImage(location));
  }
}