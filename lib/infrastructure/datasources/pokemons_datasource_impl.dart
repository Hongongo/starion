import 'package:dio/dio.dart';

import '../../domain/domain.dart';
import '../infrastructure.dart';

class PokemonsDatasourceImpl implements PokemonsDatasource {
  final Dio dio;

  PokemonsDatasourceImpl()
      : dio = Dio(
          BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'),
        );

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    try {
      final resp = await dio.get('/pokemon/$id');
      final pokemon = PokemonMapper.pokeApiPokemonToEntity(resp.data);

      return (pokemon, 'Data obtenida correctamente');
    } catch (e) {
      return (null, 'No se pudo obtener el pokémon $e');
    }
  }
}