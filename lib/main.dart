import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugas_uas_1/screen/welcome.dart';
import 'screen/admin/admin_dashboard.dart';
import 'firebase_options.dart'; // File ini dihasilkan oleh flutterfire configure

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan binding widget sudah diinisialisasi
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Gunakan konfigurasi platform Firebase
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EDULEARN',
      home: Welcome(),
    );
  }
}
