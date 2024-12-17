import 'package:flutter/material.dart';
import 'package:listview/layout/model/get_news.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'apiPage/news_card.dart';

// Kelas utama Newspage yang merupakan StatefulWidget
class Newspage extends StatefulWidget {
  Newspage({Key? key}) : super(key: key);

  @override
  State<Newspage> createState() => _NewspageState();
}

// State dari Newspage
class _NewspageState extends State<Newspage> {
  // Fungsi untuk mengambil data dari API secara asinkron
  Future<List<Getnews>> fetchPosts() async {
    // Permintaan HTTP GET ke endpoint API
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    // Log status code dan body ke console (untuk debugging)
    print(response.statusCode);
    print(response.body);

    // Jika respon sukses (status code 200), parse JSON menjadi list
    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List; // Decode JSON
      // Konversi setiap item JSON ke dalam objek Getnews
      var listPosts = getPostsData.map((i) => Getnews.fromJson(i)).toList();
      return listPosts; // Mengembalikan list berita
    } else {
      // Jika gagal, lemparkan exception
      throw Exception('Failed to load Posts');
    }
  }

  // Variabel futurePosts untuk menyimpan data berita
  late Future<List<Getnews>> futurePosts;

  // initState: dipanggil saat state pertama kali diinisialisasi
  @override
  void initState() {
    super.initState();
    // Memanggil fungsi fetchPosts untuk mendapatkan data
    futurePosts = fetchPosts();
  }

  // Membuat tampilan UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul di tengah
      appBar: AppBar(
        title: const Text('Posts List'), // Judul AppBar
        centerTitle: true, // Membuat judul berada di tengah
      ),
      // SafeArea memastikan UI tidak tertutup oleh notch atau sistem UI
      body: SafeArea(
        child: Padding(
          // Padding horizontal sebesar 20 pada body
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          // FutureBuilder untuk menangani data asinkron
          child: FutureBuilder<List<Getnews>>(
              future: futurePosts, // Future yang berisi data berita
              builder: (context, snapshot) {
                // Jika data berhasil diambil
                if (snapshot.hasData) {
                  return ListView.separated(
                      // Membuat item daftar
                      itemBuilder: ((context, index) {
                        var post = (snapshot.data as List<Getnews>)[index];
                        return Column(
                          children: [
                            // Menampilkan widget Newscard dengan data berita
                            Newscard(
                              getnews: Getnews(
                                  id: post.id,
                                  title: post.title,
                                  body: post.body),
                            ),
                            SizedBox(height: 20), // Spasi antar kartu
                          ],
                        );
                      }),
                      // Pemisah antar item (garis divider)
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      // Jumlah item dalam ListView
                      itemCount: (snapshot.data as List<Getnews>).length);
                }
                // Jika terjadi error saat mengambil data
                else if (snapshot.hasError) {
                  return Text('${snapshot.error}'); // Menampilkan pesan error
                }
                // Jika data masih dalam proses pemuatan
                return const CircularProgressIndicator(); // Menampilkan loading indicator
              }),
        ),
      ),
    );
  }
}
