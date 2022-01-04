import 'package:app/app/models/pokemon.dart';
import 'package:app/app/repositories/i_pokemon_repository.dart';

class PokemonController implements IPokemonRepository {
  final IPokemonRepository repository;

  PokemonController({required this.repository});

  @override
  Future<Pokemon> searchPokemon(String name) async {
    return await repository.searchPokemon(name);
  }
}
