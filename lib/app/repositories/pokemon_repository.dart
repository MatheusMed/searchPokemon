import 'package:app/app/utils/consts.dart';
import 'package:app/app/models/pokemon.dart';
import 'package:app/app/repositories/i_pokemon_repository.dart';
import 'package:dio/dio.dart';

class PokemonRepository implements IPokemonRepository {
  final Dio dio;
  PokemonRepository({required this.dio});
  @override
  Future<Pokemon> searchPokemon(String name) async {
    try {
      final response = await dio.get(url + "${name.toLowerCase()}");
      return Pokemon.fromMap(response.data);
    } catch (e) {
      return Pokemon(name: "Pokemon não encontrado", imagem: "");
    }
  }
}
