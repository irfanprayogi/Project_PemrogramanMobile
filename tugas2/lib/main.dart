import 'package:flutter/material.dart';
import 'textfield.dart';

// Fungsi utama yang menjalankan aplikasi Flutter
void main() {
  runApp(const MyApp()); // Memanggil widget MyApp sebagai root dari aplikasi
}

// MyApp adalah widget StatelessWidget yang tidak berubah
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Membuat tampilan utama aplikasi dengan tema, judul, dan halaman beranda
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Flutter', // Judul aplikasi
      theme: ThemeData(
        // Mengatur tema warna aplikasi dengan Material3 dan warna dasar ungu
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Halaman beranda yang ditampilkan pertama kali
      home: const MyHomePage(title: '20220801379 IRFAN PRAYOGI'),
    );
  }
}

// MyHomePage adalah widget StatefulWidget yang bisa berubah-ubah
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // Judul halaman beranda yang akan ditampilkan di AppBar

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State dari MyHomePage yang berisi logika dan tampilan halaman
class _MyHomePageState extends State<MyHomePage> {
  // Controller untuk menangani teks yang dimasukkan ke dalam TextField
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  // Fungsi untuk mengeksekusi aksi saat tombol Submit ditekan
  void _submit() {
    // Menampilkan teks yang dimasukkan ke dalam TextField di konsol
    print('Input 1: ${_controller1.text}');
    print('Input 2: ${_controller2.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Menampilkan judul halaman di AppBar
        title: Text(widget.title),
      ),
      body: Center(
        // Membuat konten utama halaman berada di tengah
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Menambahkan jarak di sekitar konten
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Mengatur posisi konten di tengah
            children: [
              // TextField pertama untuk input teks
              CustomTextField(controller: _controller1),
              const SizedBox(height: 16), // Menambahkan jarak antar TextField

              // TextField kedua untuk input teks
              CustomTextField(controller: _controller2),
              const SizedBox(
                  height: 16), // Menambahkan jarak antara TextField dan tombol

              // Tombol untuk mengirim data yang dimasukkan
              ElevatedButton(
                onPressed: _submit, // Memanggil fungsi _submit saat ditekan
                child: const Text('Submit'), // Teks pada tombol
              ),
            ],
          ),
        ),
      ),
    );
  }
}
