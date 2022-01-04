import 'package:app/app/controllers/pokemon_controller.dart';
import 'package:app/app/repositories/i_pokemon_repository.dart';
import 'package:app/app/repositories/pokemon_repository.dart';
import 'package:app/app/views/home/container/home_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeContainer(
        controller:
            PokemonController(repository: PokemonRepository(dio: Dio())),
      ),
    );
  }
}
