import 'package:flutter/material.dart';

// Punto de entrada de la aplicación
void main() => runApp(const MyApp());

// Widget raíz de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Mi primer delivery'; // título de la app

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        // AppBar superior con el título
        appBar: AppBar(title: const Text(appTitle)),

        // ahora hay un scroll con columnas de secciones
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(   // Imagen principal del delivery
                image: 'assets/images/logo.jpeg',
              ),
              TitleSection(    // Título con nombre y ubicación
                name: 'Delivery - Pato Lucas',
                location: 'Parque General San Martín y Aristides',
              ),
              ButtonSection(),  // Botones de acción (llamar, ubicación, compartir)
              TextSection(      // Texto descriptivo de la app
                description:
                'Venta, compra y envios de lo que sea. ¡Cuak, cuak! Sssoyyy el Pato LucaSS y te traigo el delivery másss rápido, fáSSsil y diverrrtido. Podésss pedir tu comida favorita o productoSS de las tiendasss de siempre, '
                    'y yo me encargo de llevarlo directooo a tu puerta. '
                    '¡Seguí tu pedido en tiempo real y disfrutá sin complicacionesss, '
                    'porque conmigo los pedidoSS vuelan… cuak, cuak!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget que muestra una imagen
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image; // ruta de la imagen

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover, // ajusta la imagen al espacio
    );
  }
}

//  Widget que muestra título, ubicación y un icono de estrella con número
class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name; // nombre del negocio
  final String location; // ubicación

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          // Parte izquierda: nombre y ubicación
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nombre en negrita
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // Ubicación en gris
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          // Parte derecha: estrella y número fijo
          Icon(Icons.star, color: Colors.yellow[700]),
          const SizedBox(width: 4),
          const Text('41'),
        ],
      ),
    );
  }
}

//  Widget que contiene los botones principales
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Cada botón se crea con ButtonWithText
          ButtonWithText(color: color, icon: Icons.call, label: 'Llamar'),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'Ubicación'),
          ButtonWithText(color: color, icon: Icons.share, label: 'Compartir'),
        ],
      ),
    );
  }
}

//  Widget para construir un botón con ícono y texto
class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color), // ícono
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

//  Widget que muestra un texto largo descriptivo
class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description; // texto descriptivo

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true, // permite que el texto se ajuste en varias líneas
        style: const TextStyle(fontSize: 14, height: 1.5),
      ),
    );
  }
}
