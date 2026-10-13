import 'package:flutter/material.dart';

import '../data/dummy_services.dart';
import '../models/service.dart';
import '../widgets/custom_bottom_nav.dart';
import 'catalog_screen.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'service_detail_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;
  final Set<String> _favoriteIds = {};
  void _toggleFavorite(Service service) => setState(
    () => _favoriteIds.contains(service.id)
        ? _favoriteIds.remove(service.id)
        : _favoriteIds.add(service.id),
  );
  void _openDetail(Service service) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ServiceDetailScreen(
        service: service,
        isFavorite: _favoriteIds.contains(service.id),
        onFavorite: () => _toggleFavorite(service),
      ),
    ),
  );
  void _openCatalog(String category) => setState(() => _index = 1);
  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        services: dummyServices,
        favoriteIds: _favoriteIds,
        onFavorite: _toggleFavorite,
        onDetail: _openDetail,
        onCategory: _openCatalog,
      ),
      CatalogScreen(
        services: dummyServices,
        favoriteIds: _favoriteIds,
        onFavorite: _toggleFavorite,
        onDetail: _openDetail,
      ),
      FavoritesScreen(
        services: dummyServices
            .where((s) => _favoriteIds.contains(s.id))
            .toList(),
        onFavorite: _toggleFavorite,
        onDetail: _openDetail,
      ),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: KeyedSubtree(key: ValueKey(_index), child: pages[_index]),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        index: _index,
        onChanged: (value) => setState(() => _index = value),
      ),
    );
  }
}
