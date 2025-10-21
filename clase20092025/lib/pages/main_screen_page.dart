// lib/pages/screens/main_screen.dart o lib/pages/main_screen_page.dart

import 'package:flutter/material.dart';

// Importaciones necesarias para la navegación
import './home_page.dart';
import './login_page.dart';
import './register_page.dart';
import '../navigation/public_sidebar_page.dart';
import './admin_home_page.dart'; // 💡 Importación de la nueva página de Admin


// --- CONTENIDOS DE TEXTO ---
const String _aboutAppText =
    '¡Bienvenido! Gestiona tus pedidos de delivery de forma simple y rápida. Con nuestra app, tendrás el control total, desde la cocina hasta la puerta de tu cliente.';

const String _aboutUsText =
    'Venta, compra y envíos de lo que sea. ¡Cuak, cuak! Sssoyyy el Pato LucaSS y te traigo el delivery más rápido, fácil y divertido. Podés pedir tu comida favorita o productos de las tiendas de siempre, '
    'y yo me encargo de llevarlo directo a tu puerta. ¡Seguí tu pedido en tiempo real y disfrutá sin complicaciones, porque conmigo los pedidos vuelan… cuak, cuak!';
// -----------------------------------------------------------------


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // FUNCIÓN: Muestra el mensaje flotante con marco y botón redondo (Cerrar)
  void _showAlertDialog(BuildContext context, String title, String content, Color accentColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            // Marco visible con el color de acento
            side: BorderSide(color: accentColor, width: 2.0),
          ),

          title: Text(
              title,
              style: TextStyle(color: accentColor, fontWeight: FontWeight.bold)
          ),

          content: Container(
            // Fondo ligeramente más claro para el contenido del texto
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Text(
                content,
                style: const TextStyle(color: Colors.white, fontSize: 16)
            ),
          ),

          actions: <Widget>[
            // Botón "Cerrar" redondo
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.black,
                shape: const StadiumBorder(), // Formato redondo
                elevation: 5,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Cerrar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  // FUNCIÓN: Botón principal circular (Moneda) - Tamaño 130.0
  Widget _buildActionButton(BuildContext context, String text, Widget destination, Color color) {
    const double buttonDiameter = 130.0;

    return SizedBox.square(
      dimension: buttonDiameter,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(500), // Borde circular
          ),
          elevation: 8,
          padding: EdgeInsets.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final Color accentColor = Theme.of(context).colorScheme.secondary;

    // BOTONES FLOTANTES CIRCULARES (Más grandes y espaciados)
    final Widget floatingButtons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 10),

        // 1. Botón "Sobre Nosotros"
        Tooltip(
          message: 'Sobre Nosotros',
          child: SizedBox.square(
            dimension: 65.0,
            child: FloatingActionButton(
              heroTag: "sobre_nosotros_fab",
              onPressed: () => _showAlertDialog(context, 'Sobre Nosotros', _aboutUsText, accentColor),
              child: const Icon(Icons.group, size: 30),
              backgroundColor: accentColor,
              foregroundColor: Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 25),

        // 2. Botón "Sobre esta APP"
        Tooltip(
          message: 'Sobre esta APP',
          child: SizedBox.square(
            dimension: 65.0,
            child: FloatingActionButton(
              heroTag: "sobre_app_fab",
              onPressed: () => _showAlertDialog(context, 'Sobre esta APP', _aboutAppText, accentColor),
              child: const Icon(Icons.info_outline, size: 30),
              backgroundColor: accentColor,
              foregroundColor: Colors.black,
            ),
          ),
        ),
      ],
    );


    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Center(
          child: Text(
            'DPL',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      drawer: const PublicSidebar(),

      body: Stack(
        children: [
          // 1. Contenido principal (ScrollView)
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Imagen más grande (aspectRatio 1.625)
                const ImageSection(image: 'assets/images/logo.png', aspectRatio: 1.625),
                const TitleSection(
                  name: 'DPL Envíos Locales',
                  location: 'Parque General San Martín 446',
                ),

                // --- BOTONES LOGIN / REGISTRO / INICIOS (MONEDAS) ---
                Padding(
                  // Padding vertical aumentado a 40
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: Column(
                    children: [
                      // 1. Fila para Login y Registrarse (Lado a Lado)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildActionButton(context, 'Login', const LoginPage(), accentColor),
                          _buildActionButton(context, 'Registrarse', const RegisterPage(), accentColor),
                        ],
                      ),

                      const SizedBox(height: 40), // Espacio vertical

                      // 2. Fila para Inicio Usuario e Inicio Admin
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Botón Dashboard (Inicio Usuario)
                          _buildActionButton(context, 'Inicio Usuario', const HomePage(), accentColor),

                          // 🚨 NUEVO BOTÓN: Inicio Admin
                          _buildActionButton(context, 'Inicio Admin', const AdminHomePage(), accentColor),
                        ],
                      ),
                    ],
                  ),
                ),
                // --------------------------------------------------------

                const SizedBox(height: 20),
              ],
            ),
          ),

          // 2. Botones flotantes, posicionados en la esquina superior derecha
          Positioned(
            top: 0,
            right: 16,
            child: floatingButtons,
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------
// --- SECCIONES AUXILIARES (DEFINICIONES DE CONSTRUCTORES FALTANTES) ---
// -----------------------------------------------------------------

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image, this.aspectRatio = 1.0});
  final String image;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.asset(
        image,
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});
  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              // La estrella usa el color ámbar/naranja (#E89F20) directamente.
              const Icon(Icons.star, color: Color(0xFFE89F20), size: 24),
              const SizedBox(height: 4),
              const Text(
                '41',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description, this.padding = 32.0});
  final String description;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        description,
        textAlign: padding < 32.0 ? TextAlign.left : TextAlign.center,
        style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.white),
      ),
    );
  }
}