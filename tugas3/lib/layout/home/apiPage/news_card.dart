import 'package:flutter/material.dart';
import 'package:listview/layout/model/get_news.dart';
import 'detail_news_page.dart';

class Newscard extends StatelessWidget {
  // Mendeklarasikan objek Getnews yang diteruskan ke Newscard
  const Newscard({Key? key, required this.getnews}) : super(key: key);
  final Getnews getnews; // Menyimpan data berita yang diteruskan

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // Memberikan efek bayangan pada kartu
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15), // Membuat sudut kartu melengkung
      ),
      margin: const EdgeInsets.symmetric(
          vertical: 12, horizontal: 10), // Margin kartu
      child: InkWell(
        // Fungsi untuk navigasi ke halaman detail berita saat kartu diketuk
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) {
                // Menampilkan halaman Detailnewspage dan meneruskan objek Getnews
                return Detailnewspage(getnews: getnews);
              }),
            ),
          );
        },
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Menyusun elemen secara vertikal
          children: [
            // Header dengan warna latar belakang biru
            Container(
              width: double.infinity, // Lebar container mengikuti lebar layar
              decoration: BoxDecoration(
                color: Colors
                    .blue.shade100, // Warna latar belakang biru untuk header
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), // Sudut kiri atas melengkung
                  topRight: Radius.circular(15), // Sudut kanan atas melengkung
                ),
              ),
              padding: const EdgeInsets.all(15), // Padding di dalam header
              child: Row(
                children: [
                  // Ikon artikel di sebelah kiri
                  const Icon(
                    Icons.article_outlined,
                    color: Colors.blue, // Warna ikon biru
                    size: 30, // Ukuran ikon
                  ),
                  const SizedBox(
                      width: 10), // Memberikan jarak antara ikon dan teks
                  Expanded(
                    // Menyusun teks secara otomatis agar mengisi ruang yang tersedia
                    child: Text(
                      getnews.title, // Menampilkan judul berita
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // Menebalkan teks judul
                        fontSize: 18, // Ukuran font untuk judul
                        color: Colors.black, // Warna teks
                      ),
                      maxLines: 2, // Membatasi jumlah baris judul hingga 2
                      overflow: TextOverflow
                          .ellipsis, // Memotong teks jika melebihi batas
                    ),
                  ),
                ],
              ),
            ),
            // Isi berita
            Padding(
              padding:
                  const EdgeInsets.all(15), // Padding di sekitar isi berita
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Menyusun elemen secara vertikal
                children: [
                  Text(
                    getnews.body, // Menampilkan isi berita
                    style: const TextStyle(
                      fontSize: 14, // Ukuran font untuk isi berita
                      color: Colors.grey, // Warna teks untuk isi berita
                    ),
                    maxLines: 3, // Membatasi jumlah baris isi berita hingga 3
                    overflow: TextOverflow
                        .ellipsis, // Memotong teks jika melebihi batas
                  ),
                  const SizedBox(
                      height: 15), // Memberikan jarak antara teks dan tombol
                  Align(
                    alignment:
                        Alignment.bottomRight, // Menyusun tombol di kanan bawah
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              // Menampilkan halaman Detailnewspage saat tombol "Read More" diklik
                              return Detailnewspage(getnews: getnews);
                            }),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward,
                          size: 16,
                          color: Colors.blue), // Ikon panah untuk tombol
                      label: const Text(
                        'Read More', // Teks tombol
                        style:
                            TextStyle(color: Colors.blue), // Warna teks tombol
                      ),
                    ),
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
