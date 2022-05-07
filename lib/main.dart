import 'package:flutter/material.dart';
import 'package:whatispokemon/views/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (_) => HomeScreen(),
    },
  ));
}