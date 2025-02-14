import '../../domain/domain.dart';
import '../infrastructure.dart';

class PokemonsRepositoryImpl implements PokemonRepository {
  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl({ PokemonsDatasource? datasource })
    : datasource = datasource ?? PokemonsDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    return datasource.getPokemon(id);
  }
}