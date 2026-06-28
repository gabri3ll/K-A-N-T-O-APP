import 'package:flutter/material.dart';
import 'letrasol_story_screen.dart';

class LetrasolScreen extends StatelessWidget {
  const LetrasolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Fondo Espacial Fijo
          Positioned.fill(
            child: Image.asset(
              'assets/images/Cuento 1 mundo 1/Fondo de El colibri.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Contenido Escaneable y Protegido contra Desbordamientos
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
                      padding: const EdgeInsets.only(bottom: 110), // Espacio libre para que el navbar no tape nada
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // --- SECCIÓN SUPERIOR: Título, Nori y Diálogo ---
                          Column(
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                'EL COLIBRÍ Y EL INCENDIO',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'VolteRounded',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 15),

                              // Nori posicionado arriba del texto de forma limpia
                              Image.asset(
                                'assets/images/Personaje y patrón/Personaje pose 4.png',
                                height: 90,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 15),
                              
                              // Globo de Diálogo Seguro
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Container(
                                  padding: const EdgeInsets.all(22.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.1),
                                        blurRadius: 12,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: const Text(
                                    '¡Hola! Soy Nori. Hoy quiero contarte la historia de un pequeño colibrí que, aunque era muy pequeño, tuvo un gran valor. Mientras todos huían de un incendio en el bosque, él decidió ayudar llevando gotitas de agua. ¿Crees que sus pequeñas acciones lograron hacer la diferencia? <<Haz click en la pantalla para continuar con la hostoria>>',
                                    style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Color(0xFF181CB3),
                                      height: 1.5,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 5),

                          // --- SECCIÓN INFERIOR: Isla Centrada ---
                          // --- SECCIÓN INFERIOR: Isla Centrada, más pequeña y con clic ---
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: SizedBox(
                              width: 180, 
                              child: GestureDetector(
                                onTap: () {
                                  // Navega hacia la pantalla 2 del cuento con una transición fluida
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LetrasolStoryScreen(),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/images/interfazPrincipal/Mundos/Letrasol.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 3. Navbar Lunar Superior y Fijo en la Base
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