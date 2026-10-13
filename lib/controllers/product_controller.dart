import 'package:flutter/material.dart';

import '../models/service_model.dart';

class ProductController {
  // Method untuk mengambil daftar jasa
  List<ServiceModel> getServices() {
    return [
      ServiceModel(
        name: "Jasa Kebersihan Rumah",
        category: "Kebersihan",
        price: "Rp 150.000 / kunjungan",
        description: "Layanan pembersihan seluruh ruangan rumah, termasuk sapu, pel, dan lap debu.",
        icon: Icons.cleaning_services,
      ),
      ServiceModel(
        name: "Servis AC",
        category: "Teknisi",
        price: "Rp 75.000 / unit",
        description:
            "Cuci AC, tambah freon, dan perbaikan AC bocor atau tidak dingin.",
        icon: Icons.ac_unit,
      ),
      ServiceModel(
        name: "Perbaikan Pipa Bocor",
        category: "Plumbing",
        price: "Mulai dari Rp 100.000",
        description: "Perbaikan saluran air mampet, kran bocor, dan instalasi pipa baru.",
        icon: Icons.plumbing,
      ),
      ServiceModel(
        name: "Jasa Pindahan",
        category: "Transportasi",
        price: "Rp 350.000 / armada",
        description: "Bantuan bongkar muat dan transportasi barang untuk pindahan kos atau rumah.",
        icon: Icons.local_shipping,
      ),
    ];
  }
}
