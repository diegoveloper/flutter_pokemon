// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pokemon_app/domain/model/pokemon.dart';
import 'package:pokemon_app/domain/repository/pokemon_api.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider({
    required this.pokemonApi,
  });
  final PokemonApi pokemonApi;

  List<Pokemon>? pokemonList;
  List<Pokemon>? searchList;
  final debouncer = Debouncer();

  Future<void> loadPokemons() async {
    pokemonList = await pokemonApi.getPokemons();
    _setInitialList();
    notifyListeners();
  }

  void _setInitialList() {
    searchList = List<Pokemon>.from(pokemonList ?? []);
  }

  void searchPokemon(String filter) {
    debouncer.execute(() {
      final filterLowercase = filter.toLowerCase();
      if (filter == "") {
        _setInitialList();
      } else {
        searchList = List<Pokemon>.from(
          pokemonList!.where(
            (element) =>
                element.name.toLowerCase().contains(
                      filterLowercase,
                    ) ||
                element.id.toLowerCase().contains(filterLowercase),
          ),
        );
      }
      notifyListeners();
    });
  }
}

class Debouncer {
  Timer? timer;

  void execute(VoidCallback action) {
    timer?.cancel();
    timer = Timer(const Duration(seconds: 1), action);
  }
}
