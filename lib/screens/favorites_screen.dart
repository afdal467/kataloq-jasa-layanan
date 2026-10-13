import 'package:flutter/material.dart';

import '../models/service.dart';
import '../widgets/service_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    required this.services,
    required this.onFavorite,
    required this.onDetail,
  });
  final List<Service> services;
  final ValueChanged<Service> onFavorite;
  final ValueChanged<Service> onDetail;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Favorit',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w800,
            color: Color(0xFF102A43),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          services.isEmpty
              ? 'Simpan jasa yang ingin kamu gunakan nanti.'
              : '${services.length} jasa tersimpan untukmu',
        ),
        const SizedBox(height: 20),
        Expanded(
          child: services.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEAF4FF),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_border_rounded,
                          size: 50,
                          color: Color(0xFF1976D2),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Belum ada jasa favorit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF102A43),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Ketuk ikon hati pada jasa yang kamu sukai.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  itemCount: services.length,
                  padding: const EdgeInsets.only(bottom: 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
              childAspectRatio: .63,
                  ),
                  itemBuilder: (_, i) {
                    final s = services[i];
                    return ServiceCard(
                      service: s,
                      isFavorite: true,
                      onFavorite: () => onFavorite(s),
                      onTap: () => onDetail(s),
                    );
                  },
                ),
        ),
      ],
    ),
  );
}
