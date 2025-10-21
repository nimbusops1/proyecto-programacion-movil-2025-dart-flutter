// lib/pages/screens/delivery_profile_page.dart

import 'package:flutter/material.dart';

// Color de acento usado en todo el tema (Naranja/Ámbar)
const Color accentColor = Color(0xFFE89F20); // Se mantiene para el cuerpo

// --- Datos Ficticios para Simular la Búsqueda ---
final List<Map<String, dynamic>> _deliveryStats = [
  {'name': 'Lucas P.', 'today': 15, 'week': 75, 'month': 300, 'id': 1},
  {'name': 'María S.', 'today': 12, 'week': 60, 'month': 250, 'id': 2},
  {'name': 'Carlos G.', 'today': 8, 'week': 40, 'month': 180, 'id': 3},
  {'name': 'Ana M.', 'today': 10, 'week': 55, 'month': 220, 'id': 4},
  {'name': 'Pedro R.', 'today': 6, 'week': 35, 'month': 150, 'id': 5},
];
// ------------------------------------------------

class DeliveryProfilePage extends StatelessWidget {
  final String deliveryName;
  final int deliveryId;

  const DeliveryProfilePage({
    super.key,
    required this.deliveryName,
    required this.deliveryId
  });

  // FUNCIÓN: Busca las estadísticas del repartidor por ID
  Map<String, dynamic> getStats() {
    return _deliveryStats.firstWhere(
          (stats) => stats['id'] == deliveryId,
      orElse: () => {'name': deliveryName, 'today': 0, 'week': 0, 'month': 0, 'id': deliveryId},
    );
  }

  @override
  Widget build(BuildContext context) {
    final stats = getStats();
    // Obtener el color de acento del tema (por si lo cambias en theme.dart)
    final themeAccentColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      // El fondo del cuerpo debe seguir siendo negro
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        // 🚨 ELIMINAMOS backgroundColor y foregroundColor para que herede del theme.dart

        title: Text(
          'Perfil de $deliveryName',
          // 🚨 El TextStyle debe ser omitido o usar el color del tema si quieres respetar theme.dart
          // Si lo forzás a Colors.black, aún respeta el tema, pero es mejor depender de titleTextStyle del tema.
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECCIÓN DE ENCABEZADO Y FOTO ---
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: themeAccentColor,
                child: Text(
                  deliveryName[0],
                  style: const TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                deliveryName,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Repartidor ID: ${stats['id']}',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ),

            const SizedBox(height: 40),

            // --- SECCIÓN DE ESTADÍSTICAS ---
            Text(
              'Estadísticas de Entrega:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: themeAccentColor),
            ),
            const SizedBox(height: 15),

            // Tarjetas de Estadísticas
            _buildStatCard(
                title: 'Pedidos Entregados Hoy',
                value: stats['today'].toString(),
                icon: Icons.access_time_filled,
                color: themeAccentColor
            ),
            _buildStatCard(
                title: 'Pedidos Entregados Esta Semana',
                value: stats['week'].toString(),
                icon: Icons.calendar_view_week,
                color: themeAccentColor
            ),
            _buildStatCard(
                title: 'Pedidos Entregados Este Mes',
                value: stats['month'].toString(),
                icon: Icons.calendar_month,
                color: themeAccentColor
            ),

            const SizedBox(height: 40),

            // Ejemplo de información adicional
            const Text(
              'Información Adicional (Ficticia)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            _buildDetailRow('Rating Promedio:', '4.8/5.0'),
            _buildDetailRow('Zona Preferida:', 'Centro (MZA)'),
            _buildDetailRow('Unidad:', 'Motocicleta'),
          ],
        ),
      ),
    );
  }

  // Widget para construir las tarjetas de estadísticas
  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color
  }) {
    return Card(
      color: Colors.grey.shade900,
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 30),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
        trailing: Text(
          value,
          style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Widget para construir filas de detalle
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
          Text(
            value,
            style: TextStyle(color: accentColor, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ],
      ),
    );
  }
}