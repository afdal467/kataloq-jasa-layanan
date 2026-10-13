import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = true;
  bool _promo = true;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Pengaturan')),
    body: ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 28), children: [
      const Text('Sesuaikan pengalaman JasaKita sesuai kebutuhanmu.', style: TextStyle(color: Color(0xFF627D98))), const SizedBox(height: 22),
      const Text('Notifikasi', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Color(0xFF102A43))), const SizedBox(height: 10),
      _settingCard(SwitchListTile.adaptive(value: _notification, onChanged: (value) => setState(() => _notification = value), title: const Text('Notifikasi layanan', style: TextStyle(fontWeight: FontWeight.w700)), subtitle: const Text('Info status pesanan dan jasa favorit'))),
      const SizedBox(height: 10), _settingCard(SwitchListTile.adaptive(value: _promo, onChanged: (value) => setState(() => _promo = value), title: const Text('Promo dan rekomendasi', style: TextStyle(fontWeight: FontWeight.w700)), subtitle: const Text('Dapatkan penawaran jasa terbaik'))),
      const SizedBox(height: 24), const Text('Akun', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Color(0xFF102A43))), const SizedBox(height: 10),
      _settingCard(const ListTile(leading: Icon(Icons.language_rounded, color: Color(0xFF1976D2)), title: Text('Bahasa', style: TextStyle(fontWeight: FontWeight.w700)), trailing: Text('Indonesia'))),
    ]),
  );
  Widget _settingCard(Widget child) => Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: const [BoxShadow(color: Color(0x0A102A43), blurRadius: 16, offset: Offset(0, 5))]), child: child);
}
