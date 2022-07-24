import 'package:pokemon_app/domain/model/pokemon.dart';

abstract class PokemonApi {
  Future<List<Pokemon>> getPokemons();
}
