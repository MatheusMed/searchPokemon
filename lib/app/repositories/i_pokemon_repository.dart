import 'package:app/app/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<Pokemon> searchPokemon(String name);
}
