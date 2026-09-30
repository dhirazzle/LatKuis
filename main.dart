import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Menghilangkan tulisan "DEBUG" di pojok
      title: 'Kuliner',
      home: LoginPage(), // Menampilkan halaman login sebagai halaman pertama
    );
  }
}
