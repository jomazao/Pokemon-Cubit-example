abstract class PokemonListState {
  final List<String> pokemonList;
  PokemonListState(this.pokemonList);
}

class InitialState extends PokemonListState {
  InitialState() : super([]);
}

class LoadedPokemon extends PokemonListState {
  LoadedPokemon(List<String> pokemonList) : super(pokemonList);
}

class Loading extends PokemonListState {
  Loading(List<String> pokemonList) : super(pokemonList);
}
