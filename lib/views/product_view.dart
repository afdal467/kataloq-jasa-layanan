import 'package:flutter/material.dart';

import '../controllers/product_controller.dart';
import '../models/service_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    // Panggil controller untuk mendapatkan data
    final ProductController controller = ProductController();
    final List<ServiceModel> services = controller.getServices();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Jasa Layanan'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final ServiceModel service = services[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                radius: 30,
                child: Icon(service.icon, color: Colors.blueAccent, size: 30),
              ),
              title: Text(
                service.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    service.category,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    service.price,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // TODO: Navigasi ke halaman detail
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Memilih: ${service.name}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
