import 'package:whatispokemon/models/pokemon.dart';

List<Pokemon> CarregarPokemons () {
  final pokemons = [
    Pokemon(
        id: 001,
        nome: 'Bulbasaur',
        poder: 3,
        url: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png'
    ),
    Pokemon(
        id: 002,
        nome: 'Ivysaur',
        poder: 4,
        url: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png'
    ),
    Pokemon(
        id: 003,
        nome: 'Venusaur',
        poder: 5,
        url: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/003.png'
    ),
  ];
  return pokemons;
}