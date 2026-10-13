import 'package:flutter/material.dart';

import '../data/dummy_services.dart';
import '../models/service.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/category_item.dart';
import '../widgets/service_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.services,
    required this.favoriteIds,
    required this.onFavorite,
    required this.onDetail,
    required this.onCategory,
  });

  final List<Service> services;
  final Set<String> favoriteIds;
  final ValueChanged<Service> onFavorite;
  final ValueChanged<Service> onDetail;
  final ValueChanged<String> onCategory;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final popular = widget.services
        .where((s) => s.name.toLowerCase().contains(_query.toLowerCase()))
        .take(4)
        .toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
      children: [
        const Text(
          'Halo, selamat datang!',
          style: TextStyle(fontSize: 14, color: Color(0xFF627D98)),
        ),
        const SizedBox(height: 5),
        const Text(
          'Jasa terbaik untuk\nkebutuhanmu',
          style: TextStyle(
            fontSize: 27,
            height: 1.16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF102A43),
          ),
        ),
        const SizedBox(height: 20),
        AppSearchBar(onChanged: (value) => setState(() => _query = value)),
        const SizedBox(height: 20),
        Container(
          height: 154,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              colors: [Color(0xFF146CC2), Color(0xFF45A8F6)],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Promo spesial\nhari ini!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Lihat promo',
                        style: TextStyle(
                          color: Color(0xFF1976D2),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.discount_rounded,
                size: 75,
                color: Color(0xFFE5F4FF),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Kategori jasa',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF102A43),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 102,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length - 1,
            separatorBuilder: (_, _) => const SizedBox(width: 9),
            itemBuilder: (_, i) {
              final c = categories[i + 1];
              return CategoryItem(
                label: c,
                icon: categoryIcons[c]!,
                onTap: () => widget.onCategory(c),
              );
            },
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Jasa populer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF102A43),
              ),
            ),
            TextButton(
              onPressed: () => widget.onCategory('Semua'),
              child: const Text('Lihat semua'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (popular.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 36),
            child: Center(child: Text('Jasa belum ditemukan.')),
          ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: popular.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          childAspectRatio: .63,
          ),
          itemBuilder: (_, i) {
            final s = popular[i];
            return ServiceCard(
              service: s,
              isFavorite: widget.favoriteIds.contains(s.id),
              onFavorite: () => widget.onFavorite(s),
              onTap: () => widget.onDetail(s),
            );
          },
        ),
      ],
    );
  }
}
