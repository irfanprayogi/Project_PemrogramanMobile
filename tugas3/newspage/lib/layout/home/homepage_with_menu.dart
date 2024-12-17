import 'package:flutter/material.dart';
//import 'package:listview/layout/home/my_homepage.dart';
import 'package:listview/layout/home/list_with_cards.dart';
import 'package:listview/layout/home/grid_view_learning.dart';
import 'package:listview/layout/home/news_page.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  // Variabel untuk melacak indeks tab saat ini di BottomNavigationBar
  int _currentIndex = 0;

  // List yang berisi widget-widget yang akan ditampilkan di setiap tab
  final List<Widget> _tabs = [
    //MyHomePage(), // Baris ini di-comment karena belum digunakan
    Newspage(), // Halaman berita
    GridViewLearning(), // Halaman GridView
    ListsWithCards(), // Halaman ListView dengan kartu
  ];

  @override
  Widget build(BuildContext context) {
    // Menggunakan Scaffold sebagai struktur dasar layar
    return Scaffold(
      // AppBar: bagian atas layar dengan judul dan gaya
      appBar: AppBar(
        title: Text(
          ' BELAJAR AJA ', // Judul AppBar
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      // Body: menampilkan widget sesuai dengan tab yang dipilih
      body: _tabs[_currentIndex],

      // BottomNavigationBar: navigasi di bagian bawah layar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Menunjukkan tab yang aktif saat ini
        onTap: (int index) {
          // Fungsi saat tab ditekan
          setState(() {
            _currentIndex = index; // Mengubah indeks tab aktif
          });
        },
        // Daftar item navigasi bawah
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk tab Home
            label: 'Home', // Label untuk tab Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3), // Ikon untuk tab GridView
            label: 'GridView', // Label untuk tab GridView
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list), // Ikon untuk tab ListView
            label: 'ListView', // Label untuk tab ListView
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.newspaper),
          //   label: 'News',
          // ),
          // Baris ini di-comment karena tab "News" tidak digunakan
        ],
      ),
    );
  }
}
