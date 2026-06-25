import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Fondo Espacial Fijo
          Positioned.fill(
            child: Image.asset(
              'assets/images/interfazPrincipal/Fondo_de_mapa.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Contenido Desplazable (Los 5 Mundos en Zigzag)
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 60, bottom: 180), // Espacio para que el último mundo no quede tapado por el navbar
              child: Column(
                children: [
                  // Mundo 5 (Superior) - Alineado a la derecha
                  _buildMundoItem(
                    imagePath: 'assets/images/interfazPrincipal/Mundos/Misteria.png',
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 30),
                    onTap: () => _onMundoSelected(context, 5),
                  ),
                  const SizedBox(height: 40),

                  // Mundo 4 - Alineado a la izquierda
                  _buildMundoItem(
                    imagePath: 'assets/images/interfazPrincipal/Mundos/Palabral.png',
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 30),
                    onTap: () => _onMundoSelected(context, 4),
                  ),
                  const SizedBox(height: 40),

                  // Mundo 3 - Centro/Derecha
                  _buildMundoItem(
                    imagePath: 'assets/images/interfazPrincipal/Mundos/Cuentaria.png',
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 40),
                    onTap: () => _onMundoSelected(context, 3),
                  ),
                  const SizedBox(height: 40),

                  // Mundo 2 - Centro/Izquierda
                  _buildMundoItem(
                    imagePath: 'assets/images/interfazPrincipal/Mundos/Nubelia.png',
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 40),
                    onTap: () => _onMundoSelected(context, 2),
                  ),
                  const SizedBox(height: 40),

                  // Mundo 1 (Inferior) - Centro/Derecha
                  _buildMundoItem(
                    imagePath: 'assets/images/interfazPrincipal/Mundos/Letrasol.png',
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 30),
                    onTap: () => _onMundoSelected(context, 1),
                  ),
                ],
              ),
            ),
          ),

          // 3. Navbar Lunar Flotante (Fijo abajo)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildNavbarLunar(),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para renderizar cada mundo con su respectiva posición
  Widget _buildMundoItem({
    required String imagePath,
    required Alignment alignment,
    required EdgeInsets padding,
    required VoidCallback onTap,
  }) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: 160, // Ajusta el tamaño según tus assets
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }

  // Estructura del Navbar Lunar con los textos descriptivos solicitados
  Widget _buildNavbarLunar() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // La silueta de la superficie lunar como fondo del menú
        Image.asset(
          'assets/images/interfazPrincipal/navbar_lunar.png',
          width: double.infinity,
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
        
        // Contenedor de los botones con sus etiquetas de texto
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0), // Ajustar según la curvatura de tu asset lunar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavbarButton(
                iconPath: 'assets/images/interfazPrincipal/Iconos de App/Icono_de_ajustes.png',
                label: 'AJUSTES',
              ),
              _buildNavbarButton(
                iconPath: 'assets/images/interfazPrincipal/Iconos de App/Icono_Home.png',
                label: 'INICIO',
              ),
              _buildNavbarButton(
                iconPath: 'assets/images/interfazPrincipal/Iconos de App/Icono_Logros.png',
                label: 'LOGROS',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Botón individual del Navbar con texto inferior usando Comfortaa
  Widget _buildNavbarButton({required String iconPath, required String label}) {
    return InkWell(
      onTap: () {
        // Acción del botón
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 60, // Tamaño del icono azul contenedor
            height: 60,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color(0xFF181CB3), // Azul oscuro oficial de tu paleta
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  void _onMundoSelected(BuildContext context, int mundoId) {
    // Aquí gestionaremos la navegación a los cuentos de cada mundo
    print("Mundo $mundoId seleccionado");
  }
}