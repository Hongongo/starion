import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey = 'com.stardev.starpoint.fetch-background-pokemon';
const fetchPeriodicBackgroundTaskKey =
    'com.stardev.starpoint.fetch-periodic-background-pokemon';

// Mandatory if the App is obfuscated or using Flutter 3.1+
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        // await loadNextPokemon();
        print(fetchBackgroundTaskKey);
        break;

      case fetchPeriodicBackgroundTaskKey:
        // await loadNextPokemon();
        print(fetchPeriodicBackgroundTaskKey);
        break;

      case Workmanager.iOSBackgroundTask:
        print('Workmanager.iOSBackgroundTask');
        break;
    }

    return true;
    //simpleTask will be emitted here.
    // return Future.value(true);
  });
}


// Future loadNextPokemon() async {
//   final localDbRepository = LocalDbRepositoryImpl();
//   final pokemonRepository = PokemonsRepositoryImpl();

//   final lastPokemonId = await localDbRepository.pokemonCount() + 1;

//   try {
//     final ( pokemon, message ) = await pokemonRepository.getPokemon('$lastPokemonId');
//     if ( pokemon == null ) throw message;

//     await localDbRepository.insertPokemon(pokemon);
//     print('Pokemon inserted: ${ pokemon.name }!!');
//   } catch (e) {
//     print('$e');
//   }
// }