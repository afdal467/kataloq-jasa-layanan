import 'package:flutter/material.dart';

import '../models/service.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service, required this.onTap, required this.isFavorite, required this.onFavorite});
  final Service service;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Color(0x120E2942), blurRadius: 18, offset: Offset(0, 7))]),
    child: Material(color: Colors.white, borderRadius: BorderRadius.circular(20), clipBehavior: Clip.antiAlias, child: InkWell(onTap: onTap, child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: Container(width: double.infinity, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [service.color.withOpacity(.96), service.color.withOpacity(.60)])), child: Stack(children: [
        Positioned(right: -16, bottom: -24, child: Container(width: 84, height: 84, decoration: BoxDecoration(color: Colors.white.withOpacity(.14), shape: BoxShape.circle))), Center(child: Icon(service.icon, color: Colors.white, size: 46)),
        Positioned(top: 6, right: 6, child: Material(color: Colors.white.withOpacity(.94), shape: const CircleBorder(), child: InkWell(customBorder: const CircleBorder(), onTap: onFavorite, child: Padding(padding: const EdgeInsets.all(8), child: Icon(isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded, size: 18, color: isFavorite ? Colors.redAccent : const Color(0xFF52616B))))))
      ]))),
      const SizedBox(height: 10), Text(service.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF102A43), fontSize: 13, fontWeight: FontWeight.w800)), const SizedBox(height: 5),
      Row(children: [const Icon(Icons.star_rounded, size: 16, color: Color(0xFFFFB000)), const SizedBox(width: 3), Text('${service.rating}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)), Text(' (${service.reviewCount})', style: const TextStyle(fontSize: 11, color: Color(0xFF829AB1)))]), const SizedBox(height: 7),
      const Text('Mulai dari', style: TextStyle(fontSize: 10, color: Color(0xFF829AB1))), Text(service.price, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF1976D2), fontWeight: FontWeight.w800, fontSize: 13)),
    ])))),
  );
}
