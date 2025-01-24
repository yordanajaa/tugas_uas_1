import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_uas_1/screen/akunsetting.dart';
import 'package:tugas_uas_1/screen/faq.dart';
import 'package:tugas_uas_1/screen/lainya.dart';
import '../screen/welcome.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Akun"),
            subtitle: const Text("Atur akun"),
            onTap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountSettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Bantuan"),
            subtitle: const Text("FAQ dan cara menghubungi tim kami"),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FAQApp(),
                ),
              );
              // Tambahkan logika ke halaman FAQ
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("Lainnya"),
            subtitle: const Text("Kebijakan privasi dan ketentuan aplikasi"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LainyaScreen(),
                ),
              );// Tambahkan logika ke halaman lainnya
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut(); // Logout dari Firebase
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Welcome()),
                  (route) => false, // Menghapus semua rute sebelumnya
                );
              } catch (e) {
                // Menangani error jika logout gagal
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Gagal logout: $e")),
                );
              }
            },
            child: const Text("Keluar Akun"),
          ),
        ],
      ),
    );
  }
}
