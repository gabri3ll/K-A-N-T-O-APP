import 'package:flutter/material.dart';
import 'letrasol_quiz_screen.dart';

class LetrasolStoryScreen extends StatelessWidget {
  const LetrasolStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Fondo Espacial Fijo (Mantiene la coherencia visual con la pantalla 1)
          Positioned.fill(
            child: Image.asset(
              'assets/images/Cuento 1 mundo 1/Fondo de El colibri.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Contenido Scrollable en formato de Cuento / Cómic Infantil
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 15.0,
                  bottom: 120.0, // Espacio generoso para que el navbar lunar no tape la última escena
                ),
                child: Column(
                  children: [
                    // ================= ESCENA 1 =================
                    Image.asset(
                      'assets/images/Cuento 1 mundo 1/Escenario 1- el colibri.png', // Ajusta las rutas según tus assets
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 15),
                    _buildGloboTexto(
                      'Hace mucho tiempo, en un hermoso bosque, comenzó un gran incendio. Las llamas crecían rápidamente y todos los animales salieron corriendo para ponerse a salvo.\n\nTodos... excepto un pequeño colibrí.',
                    ),
                    
                    const SizedBox(height: 40), // Separación limpia entre bloques de la historia

                    // ================= ESCENA 2 (Con Nori de acompañante a la derecha) =================
                    Image.asset(
                      'assets/images/Cuento 1 mundo 1/Escenario 2- el colibri.png',
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Globo de texto adaptativo a la izquierda
                        Expanded(
                          flex: 7,
                          child: _buildGloboTexto(
                            'Mientras los demás huían, el colibrí volaba una y otra vez hasta un río cercano. Tomaba una gotita de agua con su pico y la dejaba caer sobre el fuego.\n\nUn león lo observó y le preguntó:\n\n—¿De verdad crees que podrás apagar un incendio tan grande con unas pocas gotas?',
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Nori flotando a la derecha como observador
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Image.asset(
                              'assets/images/Personaje y patrón/Personaje pose 4.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // ================= ESCENA 3 =================
                    // ================= ESCENA 3 =================
                    Image.asset(
                      'assets/images/Cuento 1 mundo 1/Escenario 3- el colibri.png',
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 15),
                    _buildGloboTexto(
                      'El colibrí respondió:\n\n—Tal vez no pueda apagarlo yo solo, pero estoy haciendo mi parte.\n\nLas palabras del colibrí hicieron pensar al león. Entonces decidió ayudar. Poco a poco, otros animales también se unieron.',
                    ),

                    const SizedBox(height: 40), // Espacio antes del botón

                    // ================= BOTÓN CONTINUAR =================
                    GestureDetector(
                      onTap: () {
                        // Navegación a la siguiente actividad o pantalla (Pantalla 3)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LetrasolQuizScreen(), // <-- Cambia esto por el nombre de tu próxima pantalla
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF181CB3), // Un azul vibrante que contrasta genial
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF181CB3).withValues(alpha: 0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Haz click acá para continuar',
                              style: TextStyle(
                                fontFamily: 'VolteRounded',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

  // Widget reutilizable para los globos de diálogo blancos
  Widget _buildGloboTexto(String texto) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontFamily: 'Comfortaa',
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: Color(0xFF333333), // Un gris oscuro/carbón legible para niños
          height: 1.4,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  // Navbar lunar idéntico para mantener el estándar del proyecto
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6A11BB).withValues(alpha: 0.25),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
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