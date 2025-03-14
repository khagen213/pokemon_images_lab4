import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // Needed to decode API response

void main() {
  runApp(PokemonApp());
}

class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon TCG App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PokemonListScreen(),
    );
  }
}

class PokemonListScreen extends StatefulWidget {
  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<dynamic> pokemonCards = [];

  @override
  void initState() {
    super.initState();
    fetchPokemonCards();
  }

  Future<void> fetchPokemonCards() async {
    final dio = Dio();
    final response = await dio.get('https://api.pokemontcg.io/v2/cards');

    if (response.statusCode == 200) {
      setState(() {
        pokemonCards = response.data['data'];
      });
    }
  }

  void showFullImage(String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullImageScreen(imageUrl: imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokémon TCG Cards')),
      body: pokemonCards.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: pokemonCards.length,
        itemBuilder: (context, index) {
          final card = pokemonCards[index];
          return ListTile(
            leading: Image.network(card['images']['small']),
            title: Text(card['name']),
            onTap: () => showFullImage(card['images']['large']),
          );
        },
      ),
    );
  }
}

class FullImageScreen extends StatelessWidget {
  final String imageUrl;
  FullImageScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}