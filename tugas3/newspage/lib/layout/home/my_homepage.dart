import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  // Konstruktor kelas dengan key opsional (menggunakan 'super.key')
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      // Body: area utama dari halaman
      body: Center(
        // Center memastikan widget di dalamnya berada di tengah layar
        child: Text("Coba"), // Menampilkan teks "Coba" di tengah halaman
      ),
    );
  }
}
