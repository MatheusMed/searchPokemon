import 'package:app/app/models/pokemon.dart';
import 'package:app/app/repositories/i_pokemon_repository.dart';
import 'package:app/app/views/home/home_error.dart';
import 'package:app/app/views/home/home_loading.dart';
import 'package:app/app/views/home_view.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatefulWidget {
  final IPokemonRepository controller;

  HomeContainer({required this.controller});
  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  late Future<Pokemon> _future;
  var _name = "";

  @override
  void initState() {
    _future = widget.controller.searchPokemon(_name);
    super.initState();
  }

  void searchNamePokemon(String name) {
    setState(() {
      _name = name;
      _future = widget.controller.searchPokemon(_name);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: FutureBuilder<Pokemon>(
        future: _future,
        builder: (ctx, snap) {
          if (snap.hasData) {
            return HomeView(
              pokemon: snap.data!,
              valueChanged: searchNamePokemon,
            );
          }
          if (snap.connectionState == ConnectionState.waiting) {
            return HomeLoading();
          }
          return HomeError(error: 'Erro ao carregar os dados');
        },
      ),
    );
  }
}
