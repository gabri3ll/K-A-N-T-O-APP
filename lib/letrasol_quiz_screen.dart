import 'package:flutter/material.dart';
import 'letrasol_result_screen.dart';

class LetrasolQuizScreen extends StatelessWidget {
  const LetrasolQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Fondo del Castillo Mágico / Entorno
          Positioned.fill(
            child: Image.asset(
              'assets/images/Cuento 1 mundo 1/Fondo de El colibri.png', // Usa el fondo correspondiente de image_f9b135.png
              fit: BoxFit.cover,
            ),
          ),

          // 2. Contenido de la Trivia con protección contra desbordamientos
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 110.0), // Respetar espacio del navbar lunar
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // --- PARTE SUPERIOR: Título, Avatar y Pregunta ---
                          Column(
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                'Recolectando experiencia',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'VolteRounded',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white,
                                  letterSpacing: 1.1,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Avatar Nori centrado de forma destacada
                              Image.asset(
                                'assets/images/Personaje y patrón/Personaje pose 1.png',
                                height: 110,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 20),

                              // Globo con la Pregunta del cuento
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.95),
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.08),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: const Text(
                                    '¿Qué acción realizaba el pequeño colibrí una y otra vez para intentar apagar el incendio del bosque?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Color(0xFF181CB3),
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          // --- PARTE CENTRAL: Opciones de Respuesta en un Row Seguro ---
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                // Opción Incorrecta
                                Expanded(
                                  child: _buildTarjetaRespuesta(
                                    context,
                                    text: 'Llevar ramitas secas con sus patas.',
                                    esCorrecta: false,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                // Opción Correcta
                                Expanded(
                                  child: _buildTarjetaRespuesta(
                                    context,
                                    text: 'Llevar gotitas de agua en su pico.',
                                    esCorrecta: true,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // --- PARTE INFERIOR: Espaciado para la ilustración del castillo de base ---
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 3. Navbar Lunar Fijo en la Base
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

  // Constructor dinámico para las tarjetas de respuestas en blanco
  Widget _buildTarjetaRespuesta(BuildContext context, {required String text, required bool esCorrecta}) {
    return GestureDetector(
      onTap: () {
        // Redirección directa mandando el parámetro de éxito o fallo
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResultScreen(isCorrect: esCorrecta),
          ),
        );
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF333333),
              height: 1.3,
            ),
          ),
        ),
      ),
    );
  }
  // Navbar lunar base
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
            onTap: () => Navigator.pop(context),
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