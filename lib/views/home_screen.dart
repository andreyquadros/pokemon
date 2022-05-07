import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:whatispokemon/mock/pokemons_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var pokemons = CarregarPokemons();
  var pokemon_rodada;
  var resposta_correta = ' ';

  TextEditingController _pokemon_digitado = TextEditingController();

  void _verificarPokemon(_pokemon_digitado){
    if(pokemon_rodada.nome == _pokemon_digitado.text){
      print('Você acertou!!');
      resposta_correta = 'Você acertou! O pokemon era o ${pokemon_rodada.nome}';
    }
    else {
      print('Você errou!');
      resposta_correta = 'Você errou!! Tente novamente!';
    }
  }

  @override
  Widget build(BuildContext context) {
    pokemons.shuffle();
    pokemon_rodada = pokemons[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('Você é capaz de descobrir...'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
        SizedBox(
          height: 250,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network('${pokemon_rodada.url}'),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    alignment: Alignment.center,
                    child: Text('QUAL É ESSE POKEMON?', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              controller: _pokemon_digitado,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Qual é o seu palpite? ',
              ),
            ),
          ),
          Container(width: 380,
              child: ElevatedButton.icon(onPressed: () {
                setState(() {
                  _verificarPokemon(_pokemon_digitado);
                });

              }, icon: Icon(Icons.start), label: Text('Chutar'))),

          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(resposta_correta),
          ),
        ],
      ),
    );
  }
}
