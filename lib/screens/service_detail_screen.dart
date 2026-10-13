import 'package:flutter/material.dart';

import '../models/service.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({
    super.key,
    required this.service,
    required this.isFavorite,
    required this.onFavorite,
  });
  final Service service;
  final bool isFavorite;
  final VoidCallback onFavorite;

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  late bool favorite;

  @override
  void initState() {
    super.initState();
    favorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final service = widget.service;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 270,
            pinned: true,
            backgroundColor: service.color,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(.9),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFF102A43),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(.9),
                  child: IconButton(
                    icon: Icon(
                      favorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: favorite
                          ? Colors.redAccent
                          : const Color(0xFF102A43),
                    ),
                    onPressed: () {
                      setState(() => favorite = !favorite);
                      widget.onFavorite();
                    },
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      service.color,
                      service.color.withOpacity(.55),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(service.icon, color: Colors.white, size: 115),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 112),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: service.color.withOpacity(.12),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      service.category,
                      style: TextStyle(
                        color: service.color,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    service.name,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF102A43),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: Color(0xFFFFB000)),
                      const SizedBox(width: 4),
                      Text(
                        '${service.rating}',
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '  (${service.reviewCount} ulasan)',
                        style: const TextStyle(color: Color(0xFF627D98)),
                      ),
                      const Spacer(),
                      Text(
                        service.price,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1976D2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  const Text(
                    'Tentang layanan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF102A43),
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    service.description,
                    style: const TextStyle(
                      height: 1.55,
                      color: Color(0xFF52616B),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Penyedia jasa',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF102A43),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE8EDF3)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: service.color.withOpacity(.15),
                          child: Icon(
                            Icons.storefront_outlined,
                            color: service.color,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service.provider,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF102A43),
                                ),
                              ),
                              const Text('Penyedia terverifikasi JasaKita'),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.verified_rounded,
                          color: Color(0xFF1976D2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        color: Colors.white,
        child: FilledButton.icon(
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Permintaan ${service.name} berhasil dibuat (demo).',
              ),
            ),
          ),
          icon: const Icon(Icons.calendar_month_rounded),
          label: const Text('Pesan Jasa'),
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(54),
            backgroundColor: const Color(0xFF1976D2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
