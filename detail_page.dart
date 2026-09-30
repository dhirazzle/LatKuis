import 'package:flutter/material.dart';

import '../models/data_makanan.dart';

class DetailPage extends StatelessWidget {
  // Variabel untuk menampung data yang dikirim dari ListPage
  final Makanan makanan;

  // Constructor wajib (required) menerima data makanan
  const DetailPage({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Masakan'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Image.network(
              makanan.imageUrl,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
              // errorBuilder untuk mengatasi HTTP error 404
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 350,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  ),
                );
              },
            ),

            // Informasi Masakan
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama
                  Text(
                    makanan.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Kategori
                  Text(
                    '${makanan.category}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                  ),

                  // Asal Daerah
                  Text(
                    'Asal Daerah: ${makanan.origin}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ),

                  // Garis pembatas
                  const Divider(height: 32, thickness: 1),

                  // Bahan Utama
                  const Text(
                    'Bahan Utama:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    makanan.mainIngredient,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ), // height untuk merenggangkan jarak antar baris teks
                  ),

                  // Rasa
                  const Text(
                    'Rasa:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    makanan.flavor,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ), // height untuk merenggangkan jarak antar baris teks
                  ),

                  // Level Pedas
                  const Text(
                    'Level Pedas:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    makanan.spicyLevel,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ), // height untuk merenggangkan jarak antar baris teks
                  ),

                  // Waktu Penyajian
                  const Text(
                    'Waktu Penyajian:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    makanan.servingTime,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ), // height untuk merenggangkan jarak antar baris teks
                  ),

                  // Garis pembatas
                  const Divider(height: 32, thickness: 1),

                  // Deskripsi
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    makanan.description,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
