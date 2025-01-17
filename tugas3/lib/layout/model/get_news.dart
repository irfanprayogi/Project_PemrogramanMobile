class Getnews {
  int id;
  String title;
  String body;

  // Konstruktor untuk menginisialisasi properti id, title, dan body
  // 'required' memastikan semua properti wajib diisi saat membuat objek Getnews
  Getnews({required this.id, required this.title, required this.body});

  // Factory constructor untuk membuat objek Getnews dari data JSON
  // Digunakan untuk mempermudah parsing data JSON ke dalam objek Getnews
  factory Getnews.fromJson(Map<String, dynamic> json) {
    return Getnews(
      id: json['id'], // Mengambil nilai 'id' dari JSON
      title: json['title'], // Mengambil nilai 'title' dari JSON
      body: json['body'], // Mengambil nilai 'body' dari JSON
    );
  }
}
