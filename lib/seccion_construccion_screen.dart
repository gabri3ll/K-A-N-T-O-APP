import 'package:flutter/material.dart';

class SeccionConstruccionScreen extends StatelessWidget {
  const SeccionConstruccionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Paleta de colores oficial del proyecto
    const Color fondoMorado = Color(0xFF6A11BB); 

    return Scaffold(
      backgroundColor: fondoMorado, // Fondo plano morado de la paleta
      body: Stack(
        children: [
          // 1. Contenido Central de Advertencia Amigable
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Avatar Nori flotando en el espacio
                    Image.asset(
                      'assets/images/Personaje y patrón/Personaje pose 4.png',
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 35),

                    // Título Principal
                    const Text(
                      'Sección en construcción',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'VolteRounded',
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.white,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Mensaje explicativo sutil para los niños
                    const Text(
                      '¡Nori está preparando una gran aventura aquí! Regresa pronto para descubrir nuevos mundos espaciales.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white70, // Usando la opacidad correcta para evitar errores
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Botón estilizado para invitar a volver de forma interactiva
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Volver atrás',
                          style: TextStyle(
                            fontFamily: 'VolteRounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: fondoMorado,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. Navbar Lunar Fijo en la Base para regresar siempre a salvo
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

  // Estructura idéntica del menú fijo del proyecto
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
            onTap: () {
              // Limpia el historial de pantallas y regresa al menú de selección principal de forma directa
              Navigator.popUntil(context, (route) => route.isFirst);
            },
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