import 'package:clase20092025/pages/sidebar_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Tu Dashboard/Home
import 'pages/login_page.dart';
import 'pages/register_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'DPL';
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFF9900),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color accentColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        leading: Builder( // aca tuve que agregar builder porque sino me daba error el Drawer().
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Aca agregamos el sidebar
            },
          ),
        ),
        title: Center(
          child: Text(
            'DPL',
            style: TextStyle(
              color: accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      drawer: const Sidebar(), // Aca se llama a la funcion de sidebar_page.dart
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ImageSection(image: 'assets/images/logo.png', aspectRatio: 2.5),
            const TitleSection(
              name: 'DPL Envíos Locales',
              location: 'Parque General San Martín 446',
            ),
            ButtonIconSection(accentColor: accentColor),
            const TextSection(
              description:
              '¡Bienvenido! Gestiona tus pedidos de delivery de forma simple y rápida. Con nuestra app, tendrás el control total, desde la cocina hasta la puerta de tu cliente.',
            ),

            // --- BOTONES LOGIN / REGISTRO / DASHBOARD ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Ir a Dashboard directo',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const TextSection(
              description:
              'Venta, compra y envíos de lo que sea. ¡Cuak, cuak! Sssoyyy el Pato LucaSS y te traigo el delivery más rápido, fácil y divertido. Podés pedir tu comida favorita o productos de las tiendas de siempre, '
                  'y yo me encargo de llevarlo directo a tu puerta. ¡Seguí tu pedido en tiempo real y disfrutá sin complicaciones, porque conmigo los pedidos vuelan… cuak, cuak!',
              padding: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}

// --- SECCIONES DE IMAGEN, TITULO, ICONOS Y TEXTO ---

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
              Icon(Icons.star, color: Colors.yellow[700], size: 24),
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

class ButtonIconSection extends StatelessWidget {
  const ButtonIconSection({super.key, required this.accentColor});
  final Color accentColor;

  Widget _buildIcon(IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.grey.shade800),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: accentColor, size: 28),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          _buildIcon(Icons.chat_bubble_outline),
          _buildIcon(Icons.location_on_outlined),
          _buildIcon(Icons.notifications_none),
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
