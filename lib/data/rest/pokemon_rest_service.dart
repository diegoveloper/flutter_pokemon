import 'package:flutter/foundation.dart';
import 'package:pokemon_app/data/pokemon_analytics.dart';
import 'package:pokemon_app/domain/model/pokemon.dart';
import 'package:pokemon_app/domain/repository/pokemon_api.dart';
import 'package:http/http.dart' as http;

const pokemonAPI =
    'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

class PokemonRestService implements PokemonApi {
  final PokemonAnalytics pokemonAnalytics;

  PokemonRestService(this.pokemonAnalytics);

  @override
  Future<List<Pokemon>> getPokemons() async {
    var url = Uri.parse(pokemonAPI);
    pokemonAnalytics.sendEvent('get list of pokemons');
    var response = await http.get(url);
    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    return pokemonFromJson(response.body);
  }
}
