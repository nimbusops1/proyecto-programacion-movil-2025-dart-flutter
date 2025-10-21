// lib/pages/screens/admin_home_page.dart

import 'package:flutter/material.dart';
// Asumiendo que esta es la ruta de tu sidebar
import '../navigation/sidebar_page.dart';
// Asume que tienes una página de detalles del repartidor
import './delivery_profile_page.dart';

// Colores
const Color accentColor = Color(0xFFE89F20); // Naranja/Ámbar

// --- Datos Ficticios (Simulación de Backend) ---
final List<Map<String, dynamic>> _deliveryRanking = [
  {'name': 'Lucas P.', 'score': 150, 'id': 1},
  {'name': 'María S.', 'score': 120, 'id': 2},
  {'name': 'Carlos G.', 'score': 95, 'id': 3},
  {'name': 'Ana M.', 'score': 80, 'id': 4},
];

final List<Map<String, dynamic>> _deliveryStats = [
  {'name': 'Lucas P.', 'today': 15, 'week': 75, 'month': 300, 'id': 1},
  {'name': 'María S.', 'today': 12, 'week': 60, 'month': 250, 'id': 2},
  {'name': 'Carlos G.', 'today': 8, 'week': 40, 'month': 180, 'id': 3},
];

final List<Map<String, dynamic>> _zoneRanking = [
  {'zone': 'Centro (MZA)', 'orders': 580},
  {'zone': 'Godoy Cruz', 'orders': 450},
  {'zone': 'Las Heras', 'orders': 320},
];

final List<Map<String, dynamic>> _dayRanking = [
  {'day': 'Viernes', 'orders': 350},
  {'day': 'Sábado', 'orders': 320},
  {'day': 'Domingo', 'orders': 280},
];
// ------------------------------------------------


class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            'Panel de Administración',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        actions: const [
          // Espacio para mantener el título centrado
          SizedBox(width: 56),
        ],
      ),
      drawer: const Sidebar(), // Reutilizamos el sidebar privado

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Sección de Estadísticas de Órdenes (Diario, Semanal, Mensual)
            _buildOrderStatistics(),
            const SizedBox(height: 30),

            // 2. Ranking de Repartidores
            _buildRankingSection(
              context,
              title: 'Ranking de Repartidores (Top 4)',
              rankingList: _deliveryRanking,
              icon: Icons.delivery_dining,
              isDeliveryRanking: true,
              accentColor: accentColor,
            ),
            const SizedBox(height: 30),

            // 3. Ranking de Zonas más Activas
            _buildRankingSection(
              context,
              title: 'Zonas Más Activas',
              rankingList: _zoneRanking,
              icon: Icons.location_on,
              isDeliveryRanking: false,
              accentColor: accentColor,
            ),
            const SizedBox(height: 30),

            // 4. Días Más Activos
            _buildRankingSection(
              context,
              title: 'Días Más Activos',
              rankingList: _dayRanking,
              icon: Icons.calendar_today,
              isDeliveryRanking: false,
              accentColor: accentColor,
            ),
            const SizedBox(height: 30),

            // 5. Perfiles de Repartidores (Acceso a Detalles)
            _buildDeliveryProfiles(context, accentColor),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS AUXILIARES ---

  Widget _buildStatisticCard({required String title, required String value, required IconData icon, required Color color}) {
    return Expanded(
      child: Card(
        color: Colors.grey.shade900,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 30),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderStatistics() {
    // Datos ficticios
    const String dailyOrders = '185';
    const String weeklyOrders = '1250';
    const String monthlyOrders = '4890';

    return Row(
      children: [
        _buildStatisticCard(
          title: 'Órdenes Diarias',
          value: dailyOrders,
          icon: Icons.local_shipping,
          color: accentColor,
        ),
        const SizedBox(width: 10),
        _buildStatisticCard(
          title: 'Órdenes Semanales',
          value: weeklyOrders,
          icon: Icons.calendar_view_week,
          color: accentColor,
        ),
        const SizedBox(width: 10),
        _buildStatisticCard(
          title: 'Órdenes Mensuales',
          value: monthlyOrders,
          icon: Icons.calendar_month,
          color: accentColor,
        ),
      ],
    );
  }

  Widget _buildRankingSection(
      BuildContext context, {
        required String title,
        required List<Map<String, dynamic>> rankingList,
        required IconData icon,
        required bool isDeliveryRanking,
        required Color accentColor,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade800),
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(), // Deshabilita el scroll interno
            shrinkWrap: true,
            itemCount: rankingList.length,
            separatorBuilder: (context, index) => Divider(color: Colors.grey.shade800, height: 1),
            itemBuilder: (context, index) {
              final item = rankingList[index];
              final leading = Text(
                '#${index + 1}',
                style: TextStyle(
                  color: index == 0 ? accentColor : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              );

              Widget trailing;
              String primaryText;
              String secondaryText;

              if (isDeliveryRanking) {
                primaryText = item['name']!;
                secondaryText = '${item['score']} puntos';
                trailing = const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16);
              } else {
                // Para Zonas y Días
                primaryText = item.values.elementAt(0).toString(); // El nombre (Zona o Día)
                secondaryText = '${item.values.elementAt(1)} órdenes'; // La cantidad
                trailing = Text(
                  secondaryText,
                  style: TextStyle(color: accentColor, fontWeight: FontWeight.bold),
                );
              }

              return ListTile(
                leading: leading,
                title: Text(
                  primaryText,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
                subtitle: isDeliveryRanking ? Text(secondaryText, style: TextStyle(color: Colors.white70)) : null,
                trailing: trailing,
                onTap: isDeliveryRanking
                    ? () {
                  // Navegar al perfil del repartidor
                  // Nota: Creamos una página ficticia para este ejemplo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeliveryProfilePage(
                        deliveryName: item['name']!,
                        deliveryId: item['id'],
                      ),
                    ),
                  );
                }
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }

  // Widget específico para acceder a los perfiles de todos los repartidores
  Widget _buildDeliveryProfiles(BuildContext context, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Monitor de Repartidores (Acceso Rápido)',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade800),
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _deliveryStats.length,
            separatorBuilder: (context, index) => Divider(color: Colors.grey.shade800, height: 1),
            itemBuilder: (context, index) {
              final stats = _deliveryStats[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(stats['name']![0], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                title: Text(stats['name']!, style: const TextStyle(color: Colors.white)),
                subtitle: Text(
                  'Hoy: ${stats['today']} | Semana: ${stats['week']} | Mes: ${stats['month']}',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeliveryProfilePage(
                        deliveryName: stats['name']!,
                        deliveryId: stats['id'],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// ------------------------------------------------
// PÁGINA FICTICIA DE PERFIL DE REPARTIDOR
// ------------------------------------------------

class DeliveryProfilePage extends StatelessWidget {
  final String deliveryName;
  final int deliveryId;

  const DeliveryProfilePage({super.key, required this.deliveryName, required this.deliveryId});

  // Busca las estadísticas del repartidor por ID
  Map<String, dynamic> getStats() {
    return _deliveryStats.firstWhere(
          (stats) => stats['id'] == deliveryId,
      orElse: () => {'name': deliveryName, 'today': 0, 'week': 0, 'month': 0},
    );
  }

  @override
  Widget build(BuildContext context) {
    final stats = getStats();

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de $deliveryName'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: accentColor,
                child: Text(deliveryName[0], style: const TextStyle(fontSize: 40, color: Colors.black)),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                deliveryName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Estadísticas de Entrega:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: accentColor),
            ),
            const SizedBox(height: 15),
            _buildStatItem('Pedidos Entregados Hoy:', stats['today'].toString()),
            _buildStatItem('Pedidos Entregados Esta Semana:', stats['week'].toString()),
            _buildStatItem('Pedidos Entregados Este Mes:', stats['month'].toString()),
            const SizedBox(height: 30),
            // Puedes agregar más detalles aquí (ej: zona, rating, etc.)
            Text(
              'ID Interno: $deliveryId',
              style: TextStyle(color: Colors.grey.shade600),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 16)),
          Text(
            value,
            style: TextStyle(color: accentColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}