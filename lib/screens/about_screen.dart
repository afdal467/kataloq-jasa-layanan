import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Tentang Aplikasi')), body: ListView(padding: const EdgeInsets.fromLTRB(20, 16, 20, 28), children: [
    Center(child: Container(width: 88, height: 88, decoration: BoxDecoration(color: const Color(0xFFEAF4FF), borderRadius: BorderRadius.circular(28)), child: const Icon(Icons.handshake_rounded, color: Color(0xFF1976D2), size: 48))), const SizedBox(height: 16), const Center(child: Text('JasaKita', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF102A43)))), const SizedBox(height: 5), const Center(child: Text('Versi 1.0.0', style: TextStyle(color: Color(0xFF627D98)))), const SizedBox(height: 30),
    Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Color(0x0A102A43), blurRadius: 16, offset: Offset(0, 5))]), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Temukan Jasa, Mudahkan Aktivitas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF102A43))), SizedBox(height: 10), Text('JasaKita adalah aplikasi katalog layanan yang membantu pengguna menemukan penyedia jasa untuk kebutuhan sehari-hari dengan cara yang mudah, cepat, dan nyaman.', style: TextStyle(height: 1.55, color: Color(0xFF52616B)))])),
  ]));
}
