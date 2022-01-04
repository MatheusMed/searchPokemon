import 'package:app/app/models/pokemon.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
    required this.pokemon,
    required this.valueChanged,
  }) : super(key: key);

  final Pokemon pokemon;
  final ValueChanged<String> valueChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: valueChanged,
            ),
            SizedBox(
              height: 30,
            ),
            if (pokemon.imagem.isNotEmpty) Image.network(pokemon.imagem),
          ],
        ),
      ),
    );
  }
}
