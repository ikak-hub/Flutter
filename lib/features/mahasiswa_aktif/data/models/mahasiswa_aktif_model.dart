// class MahasiswaAktifModel {
//   final String nama;
//   final String nim;
//   final String email;
//   final String jurusan;
//   final int semester;
//   final double ipk;
//   final String angkatan;
//   final String kelas;

//   MahasiswaAktifModel({
//     required this.nama,
//     required this.nim,
//     required this.email,
//     required this.jurusan,
//     required this.semester,
//     required this.ipk,
//     required this.angkatan,
//     required this.kelas,
//   });

//   factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
//     return MahasiswaAktifModel(
//       nama:      json['nama']      ?? '',
//       nim:       json['nim']       ?? '',
//       email:     json['email']     ?? '',
//       jurusan:   json['jurusan']   ?? '',
//       semester:  json['semester']  ?? 1,
//       ipk:       (json['ipk'] ?? 0.0).toDouble(),
//       angkatan:  json['angkatan']  ?? '',
//       kelas:     json['kelas']     ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'nama':     nama,
//     'nim':      nim,
//     'email':    email,
//     'jurusan':  jurusan,
//     'semester': semester,
//     'ipk':      ipk,
//     'angkatan': angkatan,
//     'kelas':    kelas,
//   };
// }

// Tm 5
/// Model mahasiswa aktif yang di-mapping dari API /posts
class MahasiswaAktifModel {
  final int    userId;  // userId dari posts
  final int    id;      // id dari posts
  final String title;   // title dari posts → sebagai nama/judul
  final String body;    // body dari posts

  MahasiswaAktifModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      userId: json['userId'] ?? 0,
      id:     json['id']     ?? 0,
      title:  json['title']  ?? '',
      body:   json['body']   ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id':     id,
    'title':  title,
    'body':   body,
  };

  /// NIM dari id
  String get nim => id.toString().padLeft(8, '0');

  /// Email dari userId
  String get email => 'user$userId@d4ti.ac.id';

  /// Semester dari userId
  int get semester => (userId % 8) + 1;

  /// Kelas dari userId
  String get kelas => 'TI-${['A', 'B', 'C', 'D'][userId % 4]}';

  /// Angkatan dari userId
  String get angkatan => '202${userId % 4}';

  /// IPK dummy berdasarkan id
  double get ipk => 2.5 + (id % 20) * 0.1;

  /// Nama singkat (ambil kata pertama dari title, kapital)
  String get namaDisplay {
    final words = title.split(' ');
    if (words.length >= 2) {
      return '${_cap(words[0])} ${_cap(words[1])}';
    }
    return _cap(title);
  }

  String _cap(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}
