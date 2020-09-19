import 'package:bloc/bloc.dart';
import 'package:flutter_architecture/data/pokemon_provider.dart';

import 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  PokemonListCubit() : super(InitialState());
  PokemonProvider _pokemonProvider = PokemonProvider();
  final _limit = 10;

  void next() async {
    var offset = state.pokemonList.length;
    var actualList = state.pokemonList.map((e) => e).toList();
    emit(Loading(actualList));
    await Future.delayed(Duration(seconds: 5));
    List<String> allThePokemon = await _pokemonProvider.getAll(_limit, offset);
    actualList.addAll(allThePokemon);

    emit(LoadedPokemon(actualList));
  }

  void remove() async {
    var offset = state.pokemonList.length;
    var actualList = state.pokemonList.map((e) => e).toList();
    emit(Loading(actualList));
    var newList = actualList.getRange(0, offset - _limit).toList();
    await Future.delayed(Duration(seconds: 5));
    emit(LoadedPokemon(newList));
  }

  void deleteAll() {
    emit(InitialState());
  }
}
