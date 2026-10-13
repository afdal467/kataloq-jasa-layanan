import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _hidePassword = true;
  @override void dispose() { _name.dispose(); _email.dispose(); _password.dispose(); super.dispose(); }
  void _register() {
    if (_name.text.trim().isEmpty || _email.text.trim().isEmpty || _password.text.trim().isEmpty) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lengkapi semua data terlebih dahulu.'))); return; }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Akun berhasil dibuat. Silakan masuk.')));
    Navigator.pop(context);
  }
  @override Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: ListView(padding: const EdgeInsets.all(24), children: [
      const SizedBox(height: 20), Row(children: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded)), const SizedBox(width: 6), const Text('Buat akun', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF102A43)))]), const SizedBox(height: 28),
      Container(height: 96, decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), gradient: const LinearGradient(colors: [Color(0xFF146CC2), Color(0xFF45A8F6)])), child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.rocket_launch_rounded, color: Colors.white, size: 42), SizedBox(width: 14), Text('Mulai perjalananmu\nbersama JasaKita', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800))])), const SizedBox(height: 28),
      const Text('Nama lengkap', style: TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 8), TextField(controller: _name, decoration: const InputDecoration(hintText: 'Masukkan nama kamu', prefixIcon: Icon(Icons.person_outline_rounded))), const SizedBox(height: 18),
      const Text('Email', style: TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 8), TextField(controller: _email, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(hintText: 'contoh@email.com', prefixIcon: Icon(Icons.mail_outline_rounded))), const SizedBox(height: 18),
      const Text('Kata sandi', style: TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 8), TextField(controller: _password, obscureText: _hidePassword, decoration: InputDecoration(hintText: 'Minimal 6 karakter', prefixIcon: const Icon(Icons.lock_outline_rounded), suffixIcon: IconButton(onPressed: () => setState(() => _hidePassword = !_hidePassword), icon: Icon(_hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined)))), const SizedBox(height: 26),
      SizedBox(height: 54, child: ElevatedButton(onPressed: _register, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1976D2), foregroundColor: Colors.white), child: const Text('Buat Akun', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)))), const SizedBox(height: 16), const Text('Dengan mendaftar, kamu menyetujui Ketentuan Layanan dan Kebijakan Privasi JasaKita.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, height: 1.45, color: Color(0xFF829AB1))),
    ])),
  );
}
