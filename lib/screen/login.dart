import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tugas_uas_1/screen/admin/adminnav.dart';
import 'package:tugas_uas_1/screen/psikiater/psikiaternav.dart';

import 'homenav.dart'; // Untuk pengguna umum

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // Kredensial statis untuk admin dan psikiater
    final Map<String, String> adminCredentials = {
      "email": "admin@gmail.com",
      "password": "admin123"
    };

    final Map<String, String> psikiaterCredentials = {
      "email": "psikiater@gmail.com",
      "password": "psikiater123"
    };

    Future<void> loginUser() async {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email dan password harus diisi')),
        );
        return;
      }

      try {
        // Logika login untuk admin
        if (email == adminCredentials["email"] && password == adminCredentials["password"]) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AdminScreenWithNavbar()),
          );
          return;
        }

        // Logika login untuk psikiater
        if (email == psikiaterCredentials["email"] && password == psikiaterCredentials["password"]) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PsikiaterScreenWithNavbar()),
          );
          return;
        }

        // Logika login untuk user biasa (menggunakan Firebase Authentication)
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Pindah ke halaman pengguna biasa setelah login berhasil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreenWithNavbar()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email atau password salah')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/edulearn.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Login Akun',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginUser,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
