import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Bantuan')), body: ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 28), children: [
    const Text('Ada yang bisa kami bantu?', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800, color: Color(0xFF102A43))), const SizedBox(height: 7), const Text('Pilih topik bantuan di bawah ini.'), const SizedBox(height: 22),
    _helpItem(context, Icons.search_rounded, 'Mencari jasa', 'Cara menemukan layanan yang sesuai'), _helpItem(context, Icons.favorite_border_rounded, 'Mengelola favorit', 'Simpan dan hapus jasa pilihanmu'), _helpItem(context, Icons.calendar_month_outlined, 'Memesan jasa', 'Panduan membuat permintaan jasa'), _helpItem(context, Icons.chat_bubble_outline_rounded, 'Hubungi kami', 'Kirim pesan ke pusat bantuan'),
  ]));
  Widget _helpItem(BuildContext context, IconData icon, String title, String subtitle) => Container(margin: const EdgeInsets.only(bottom: 11), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: const [BoxShadow(color: Color(0x0A102A43), blurRadius: 16, offset: Offset(0, 5))]), child: ListTile(contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), leading: Container(width: 42, height: 42, decoration: BoxDecoration(color: const Color(0xFFEAF4FF), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: const Color(0xFF1976D2))), title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF102A43))), subtitle: Text(subtitle), trailing: const Icon(Icons.chevron_right_rounded), onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title dipilih (demo).')))));
}
