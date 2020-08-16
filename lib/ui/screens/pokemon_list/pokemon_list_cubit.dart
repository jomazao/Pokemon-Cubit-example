import 'package:bloc/bloc.dart';
import 'package:flutter_architecture/data/pokemon_provider.dart';

class PokemonListCubit extends Cubit<List<String>> {
  PokemonListCubit() : super([]);
  PokemonProvider _pokemonProvider = PokemonProvider();
  final _limit = 10;
  void next() async {
    var offset = state.length;
    var actualState = state.map((e) => e).toList();
    List<String> allThePokemon = await _pokemonProvider.getAll(_limit, offset);
    actualState.addAll(allThePokemon);
    emit(actualState);
  }

  void remove() async {
    var offset = state.length;
    var actualState = state.map((e) => e).toList();

    emit(actualState.getRange(0, offset - _limit).toList());
  }

  void deleteAll() {
    emit([]);
  }
}
