import 'package:flutter/material.dart';

// CustomTextField adalah widget khusus untuk bidang teks (TextField)
// yang dapat digunakan untuk menerima input dari pengguna.
class CustomTextField extends StatelessWidget {
  // Konstruktor untuk inisialisasi CustomTextField, menerima TextEditingController
  // sebagai parameter untuk menangani dan mengontrol input teks pengguna.
  const CustomTextField({Key? key, required this.controller}) : super(key: key);

  // TextEditingController digunakan untuk mengelola dan memantau teks yang dimasukkan
  // oleh pengguna di TextField ini.
  final TextEditingController controller;

  // Build method untuk membuat tampilan widget
  @override
  Widget build(BuildContext context) {
    return TextField(
      // Menghubungkan controller dengan TextField untuk mengambil teks yang dimasukkan
      controller: controller,

      // Mengatur dekorasi atau gaya tampilan untuk TextField
      decoration: InputDecoration(
        labelText:
            'Enter text', // Label yang muncul di atas TextField saat fokus
        hintText:
            'Type something here...', // Petunjuk yang muncul di dalam TextField

        // Mengisi latar belakang TextField dengan warna abu-abu terang
        filled: true,
        fillColor: Colors.grey[200],

        // Menambahkan border dengan sudut membulat (rounded)
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(8.0), // Membuat sudut dengan radius 8
        ),
      ),
    );
  }
}
