class Terapis {
  String id;
  String nama;
  String password;
  String email;
  double rating;
  int harga;
  String lamaPengalaman;
  List<dynamic> keahlian;

  Terapis({
    required this.id,
    required this.nama,
    required this.password,
    required this.email,
    required this.rating,
    required this.harga,
    required this.lamaPengalaman,
    required this.keahlian,
  });

  factory Terapis.fromJson(Map<String, dynamic> json) {
    return Terapis(
      id: json['\$id'],
      nama: json['nama'],
      password: json['password'],
      email: json['email'],
      rating: json['rating'].toDouble(),
      harga: json['harga'].toDouble(),
      lamaPengalaman: json['lama_pengalaman'],
      keahlian: List<String>.from(json['keahlian']),
    );
  }
}
