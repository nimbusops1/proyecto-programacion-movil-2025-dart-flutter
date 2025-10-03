import 'package:flutter/material.dart';
import '../navigation/app_nav_items.dart'; // Lista con las páginas

// --- CLASE PRINCIPAL DEL HOME ---
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Índice del ítem seleccionado en la barra inferior

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // AppBar dinámico según la página seleccionada
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          mainNavItems[_currentIndex].label,
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      // Carga de contenido según la pestaña seleccionada
      body: IndexedStack(
        index: _currentIndex, // Mantiene el estado de las páginas
        children: mainNavItems.map((item) => item.pageContent).toList(),
      ),

      // Barra inferior persistente para cambiar entre páginas
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        indicatorColor: Colors.yellow.withOpacity(0.2),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          for (var item in mainNavItems)
            NavigationDestination(
              icon: Icon(item.icon, color: Colors.white),
              label: item.label,
            ),
        ],
      ),
    );
  }
}

// --- CONTENIDO INICIAL DE LA PESTAÑA "INICIO" ---
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: const [
          ProductCard(title: "Producto 1", price: "\$20.00", icon: Icons.shopping_bag),
          ProductCard(title: "Producto 2", price: "\$35.00", icon: Icons.shopping_basket),
          ProductCard(title: "Producto 3", price: "\$50.00", icon: Icons.shopping_cart),
          ProductCard(title: "Producto 4", price: "\$70.00", icon: Icons.shop_2),
        ],
      ),
    );
  }
}

// --- CARD DE CADA PRODUCTO ---
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final IconData icon;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87, // Fondo de la tarjeta
      elevation: 4, // Sombra de la tarjeta
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.red, size: 30), // Icono del producto
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.yellow,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          price,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white), // Flecha de detalle
      ),
    );
  }
}
