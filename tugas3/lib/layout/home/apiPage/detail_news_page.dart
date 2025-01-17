import 'package:flutter/material.dart';
import 'package:listview/layout/model/get_news.dart';

class Detailnewspage extends StatelessWidget {
  // Variabel getnews yang berisi data berita yang diteruskan dari halaman sebelumnya
  final Getnews getnews;

  // Konstruktor Detailnewspage yang menerima objek Getnews sebagai parameter
  const Detailnewspage({Key? key, required this.getnews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Detail Page'),
          centerTitle: true, // Menempatkan judul di tengah
          backgroundColor: Colors.blue.shade100), // Mengatur warna AppBar
      body: SafeArea(
        // SingleChildScrollView memungkinkan konten untuk scroll jika terlalu panjang
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
              16.0), // Memberikan padding di sekitar konten
          child: Column(
            // Menyusun elemen-elemen di dalam kolom secara vertikal
            crossAxisAlignment:
                CrossAxisAlignment.start, // Menjaga konten rata kiri
            children: [
              // Section untuk menampilkan ID berita
              Container(
                padding: const EdgeInsets.all(12), // Padding di dalam container
                decoration: BoxDecoration(
                  color: Colors.blue.shade50, // Latar belakang biru muda
                  borderRadius:
                      BorderRadius.circular(10), // Membuat sudut melengkung
                ),
                child: Text(
                  'ID: ${getnews.id}', // Menampilkan ID berita
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Memberikan jarak vertikal

              // Section untuk menampilkan judul berita
              Text(
                getnews.title, // Menampilkan judul berita
                style: const TextStyle(
                  fontSize: 20, // Ukuran font untuk judul
                  fontWeight: FontWeight.bold, // Menebalkan teks judul
                ),
              ),
              const Divider(
                  thickness: 1,
                  color: Colors.grey), // Pembatas antara judul dan isi
              const SizedBox(height: 10), // Memberikan jarak vertikal

              // Section untuk menampilkan label 'Body'
              const Text(
                'Body:',
                style: TextStyle(
                  fontSize: 18, // Ukuran font untuk label 'Body'
                  fontWeight: FontWeight.bold, // Menebalkan teks
                  color: Colors.black87, // Warna teks label
                ),
              ),
              const SizedBox(height: 10), // Memberikan jarak vertikal

              // Section untuk menampilkan isi berita (body)
              Text(
                getnews.body, // Menampilkan body berita
                style: const TextStyle(
                  fontSize: 16, // Ukuran font untuk body berita
                  color: Colors.black54, // Warna teks untuk body
                  height: 1.5, // Jarak antar baris dalam body
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
