import 'package:flutter/material.dart';
import 'menu_screen.dart'; // Asegúrate de importar tu menú real

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _iniciarTemporizador();
  }

  void _iniciarTemporizador() {
    // Espera 3 segundos y luego navega automáticamente al menú
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MenuScreen()), // Cambia por tu clase de menú
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Pantalla en blanco
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Image.asset(
            'assets/images/Logo y variaciones/Logo principal.png', 
            width: 220,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}