import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/screens/pokemon_list/pokemon_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonListCubit()..next(),
      child: BlocBuilder<PokemonListCubit, List<String>>(
          builder: (context, state) {
        var cubit = BlocProvider.of<PokemonListCubit>(context);
        var pokemonList = state;

        return Scaffold(
          floatingActionButton: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => cubit.next(),
              ),
              FloatingActionButton(
                child: Icon(Icons.remove),
                backgroundColor: Colors.pink,
                onPressed: () => cubit.remove(),
              ),
              FloatingActionButton(
                child: Icon(Icons.delete),
                backgroundColor: Colors.red,
                onPressed: () => cubit.deleteAll(),
              ),
            ],
          ),
          appBar: AppBar(
            title: Text(
              'Todos los Pokémon',
            ),
          ),
          body: ListView(
            children: pokemonList
                .map(
                  (e) => Text(
                    e,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      }),
    );
  }
}
