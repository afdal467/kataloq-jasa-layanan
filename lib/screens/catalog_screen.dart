import 'package:flutter/material.dart';

import '../data/dummy_services.dart';
import '../models/service.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/service_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({
    super.key,
    required this.services,
    required this.favoriteIds,
    required this.onFavorite,
    required this.onDetail,
  });
  final List<Service> services;
  final Set<String> favoriteIds;
  final ValueChanged<Service> onFavorite;
  final ValueChanged<Service> onDetail;
  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _query = '';
  String _category = 'Semua';
  @override
  Widget build(BuildContext context) {
    final list = widget.services
        .where(
          (s) =>
              (_category == 'Semua' || s.category == _category) &&
              s.name.toLowerCase().contains(_query.toLowerCase()),
        )
        .toList();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Katalog Jasa',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w800,
              color: Color(0xFF102A43),
            ),
          ),
          const SizedBox(height: 6),
          const Text('Temukan layanan yang tepat untukmu'),
          const SizedBox(height: 18),
          AppSearchBar(onChanged: (value) => setState(() => _query = value)),
          const SizedBox(height: 18),
          SizedBox(
            height: 37,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final c = categories[i];
                final active = c == _category;
                return ChoiceChip(
                  label: Text(c),
                  selected: active,
                  onSelected: (_) => setState(() => _category = c),
                  selectedColor: const Color(0xFFD9EDFF),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: active
                        ? const Color(0xFF1976D2)
                        : const Color(0xFF52616B),
                  ),
                  side: BorderSide(
                    color: active
                        ? Colors.transparent
                        : const Color(0xFFE0E7EF),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: list.isEmpty
                ? const Center(child: Text('Jasa belum ditemukan.'))
                : GridView.builder(
                    itemCount: list.length,
                    padding: const EdgeInsets.only(bottom: 24),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
            childAspectRatio: .63,
                        ),
                    itemBuilder: (_, i) {
                      final s = list[i];
                      return ServiceCard(
                        service: s,
                        isFavorite: widget.favoriteIds.contains(s.id),
                        onFavorite: () => widget.onFavorite(s),
                        onTap: () => widget.onDetail(s),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
