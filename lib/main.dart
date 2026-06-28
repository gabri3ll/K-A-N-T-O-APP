import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const KantoApp());
}

class KantoApp extends StatelessWidget {
  const KantoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Tipografía principal para la interfaz según tu guía de estilos
        fontFamily: 'VolteRounded',
        primaryColor: const Color(0xFF6A11BB), // Morado de la paleta
      ),
      home: const SplashScreen(),
    );
  }
}