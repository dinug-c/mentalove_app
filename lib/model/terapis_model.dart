class Terapis {
  final int id;
  final DateTime createdAt;
  final String name;
  final String title;
  final double rating;
  final double harga;
  final int year;
  final List<String> tags;

  Terapis({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.title,
    required this.rating,
    required this.harga,
    required this.year,
    required this.tags,
  });

  factory Terapis.fromJson(Map<String, dynamic> json) {
    // Mengambil data dari JSON dan menginisialisasi objek Terapis
    return Terapis(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      name: json['name'] as String,
      title: json['title'] as String,
      rating: json['rating'] as double,
      harga: json['harga'] as double,
      year: json['year'] as int,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    // Mengonversi objek Terapis ke dalam bentuk JSON
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'name': name,
      'title': title,
      'rating': rating,
      'harga': harga,
      'year': year,
      'tags': tags,
    };
  }
}
