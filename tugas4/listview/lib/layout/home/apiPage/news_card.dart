import 'package:flutter/material.dart';
import 'package:listview/layout/model/get_news.dart';
import 'detail_news_page.dart';

class Newscard extends StatelessWidget {
  const Newscard({Key? key, required this.getnews}) : super(key: key);
  final Getnews getnews;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) {
                return Detailnewspage(getnews: getnews);
              }),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan warna background
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade100, // Warna latar belakang header
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Icon(
                    Icons.article_outlined,
                    color: Colors.blue,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      getnews.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            // Isi berita
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getnews.body,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return Detailnewspage(getnews: getnews);
                            }),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward,
                          size: 16, color: Colors.blue),
                      label: const Text(
                        'Read More',
                        style: TextStyle(color: Colors.blue),
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
