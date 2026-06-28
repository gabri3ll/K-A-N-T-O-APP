import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  final bool isCorrect;

  const QuizResultScreen({
    super.key,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    // Definimos los colores y textos según el resultado
    final Color fondoMorado = const Color(0xFF6A11BB); // Tu morado de la paleta
    final Color fondoError = const Color(0xFF3A1C81);  // Un morado más oscuro/opaco para el fallo
    
    final String mensaje = isCorrect ? '¡Bien hecho!' : 'Respuesta incorrecta';
    final String subMensaje = isCorrect 
        ? '¡Has ganado estrellas de experiencia!' 
        : '¡No te preocupes! Inténtalo una vez más.';

    // Aquí puedes alternar las imágenes de Nori si tienes diferentes poses (ej. feliz / pensando)
    final String avatarNori = isCorrect
        ? 'assets/images/Personaje y patrón/Personaje pose 4.png' // Nori celebrando
        : 'assets/images/Personaje y patrón/Personaje pose 4.png'; // Nori animando a intentar de nuevo

    return Scaffold(
      // Usamos el fondo de color plano de tu paleta
      backgroundColor: isCorrect ? fondoMorado : fondoError,
      body: Stack(
        children: [
          // 1. Contenido Principal Centrado
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Avatar de Nori en grande
                    Image.asset(
                      avatarNori,
                      height: 160,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 40),

                    // Leyenda Principal (¡Bien hecho! o Respuesta incorrecta)
                    Text(
                      mensaje,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'VolteRounded',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Subtexto de apoyo pedagógico
                    Text(
                      subMensaje,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white70, // Blanco con un toque de transparencia para suavizar
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 50),

                    // Botón para Continuar o Reintentar
                    GestureDetector(
                      onTap: () {
                        if (isCorrect) {
                          // Si es correcto, avanza al siguiente bloque o menú principal
                          Navigator.popUntil(context, (route) => route.isFirst);
                        } else {
                          // Si es incorrecto, regresa a la trivia para que vuelva a elegir
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 35.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                          isCorrect ? 'Continuar' : 'Volver a intentar',
                          style: TextStyle(
                            fontFamily: 'VolteRounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: isCorrect ? fondoMorado : const Color(0xFF333333),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. El menú/navbar de siempre fijo abajo
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildNavbarInferior(context),
          ),
        ],
      ),
    );
  }

  // Navbar lunar idéntico para mantener la consistencia
  Widget _buildNavbarInferior(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          'assets/images/interfazPrincipal/navbar_lunar.png',
          width: double.infinity,
          fit: BoxFit.fill,
          alignment: Alignment.bottomCenter,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: GestureDetector(
            onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
            child: Container(
              width: 65,
              height: 65,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/interfazPrincipal/Iconos_de_App/Icono_Home.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}