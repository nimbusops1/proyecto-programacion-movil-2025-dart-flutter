import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        // Ejemplo de pedidos
        OrderCard(
          orderId: "001",
          productName: "Laptop Gamer Alienware",
          deliveryStatus: "En camino",
          orderDate: "01/10/2025",
          deliveryTime: "12:30 PM",
          imageUrl:
          "https://www.dell.com/support/kbdoc/en-us/000178189/alienware-wallpapers",
        ),
        SizedBox(height: 16),
        OrderCard(
          orderId: "002",
          productName: "Auriculares Bluetooth",
          deliveryStatus: "Preparando",
          orderDate: "30/09/2025",
          deliveryTime: "15:00 PM",
          imageUrl:
          "https://acdn-us.mitiendanube.com/stores/884/018/products/gamma-hogar-2022-10-25t104326-7711-f545577cf5cc3a201b16667059054363-1024-1024.jpg",
        ),
        SizedBox(height: 16),
        OrderCard(
          orderId: "003",
          productName: "Cámara Fotográfica Canon",
          deliveryStatus: "Entregado",
          orderDate: "28/09/2025",
          deliveryTime: "10:00 AM",
          imageUrl:
          "https://www.dpreview.com/sample-galleries/8212334571/canon-eos-6d-mark-ii-sample-gallery",
        ),
      ],
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String productName;
  final String deliveryStatus;
  final String orderDate;
  final String deliveryTime;
  final String imageUrl;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.productName,
    required this.deliveryStatus,
    required this.orderDate,
    required this.deliveryTime,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;

    switch (deliveryStatus.toLowerCase()) {
      case "entregado":
        statusColor = Colors.green;
        break;
      case "en camino":
        statusColor = Colors.yellow;
        break;
      case "preparando":
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.white;
    }

    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Móvil: imagen arriba del texto
            if (constraints.maxWidth < 400) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white,
                            size: 50,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildOrderInfo(statusColor),
                ],
              );
            } else {
              // Pantallas grandes: imagen a la izquierda
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        height: 120,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.white,
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    flex: 3,
                    child: _buildOrderInfo(statusColor),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildOrderInfo(Color statusColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: const TextStyle(
            color: Colors.yellow,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          "Pedido #$orderId • $orderDate",
          style: const TextStyle(color: Colors.white70, fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.local_shipping, color: statusColor, size: 18),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                deliveryStatus,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Text(
              deliveryTime,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
