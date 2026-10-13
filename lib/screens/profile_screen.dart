import 'package:flutter/material.dart';

import 'about_screen.dart';
import 'help_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(20, 18, 20, 28), children: [
    const Text('Profil', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF102A43))), const SizedBox(height: 5), const Text('Kelola akun dan preferensimu.'), const SizedBox(height: 22),
    Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22), boxShadow: const [BoxShadow(color: Color(0x0D102A43), blurRadius: 18, offset: Offset(0, 7))]), child: const Row(children: [CircleAvatar(radius: 30, backgroundColor: Color(0xFFD9EDFF), child: Icon(Icons.person_rounded, size: 35, color: Color(0xFF1976D2))), SizedBox(width: 15), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Nilu Maheswari', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Color(0xFF102A43))), SizedBox(height: 4), Text('Pengguna JasaKita'), SizedBox(height: 7), Text('Akun aktif', style: TextStyle(color: Color(0xFF13B887), fontSize: 12, fontWeight: FontWeight.w700))]))])), const SizedBox(height: 26),
    const Text('Umum', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF102A43))), const SizedBox(height: 10),
    _profileItem(context, Icons.settings_outlined, 'Pengaturan', 'Atur preferensi aplikasi', const SettingsScreen()), _profileItem(context, Icons.info_outline_rounded, 'Tentang Aplikasi', 'Versi 1.0.0', const AboutScreen()), _profileItem(context, Icons.help_outline_rounded, 'Bantuan', 'Pusat bantuan JasaKita', const HelpScreen()), const SizedBox(height: 14),
    OutlinedButton.icon(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tombol keluar hanya untuk tampilan UI.'))), icon: const Icon(Icons.logout_rounded, color: Colors.redAccent), label: const Text('Keluar', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w700)), style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(52), side: const BorderSide(color: Color(0xFFFFCDD2)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
  ]);

  Widget _profileItem(BuildContext context, IconData icon, String title, String subtitle, Widget page) => Container(margin: const EdgeInsets.only(bottom: 11), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: const [BoxShadow(color: Color(0x0A102A43), blurRadius: 16, offset: Offset(0, 5))]), child: ListTile(contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5), leading: Container(width: 42, height: 42, decoration: BoxDecoration(color: const Color(0xFFEAF4FF), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: const Color(0xFF1976D2))), title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF102A43))), subtitle: Text(subtitle), trailing: const Icon(Icons.chevron_right_rounded), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page))));
}
