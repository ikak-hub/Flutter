// class MahasiswaModel {
//   final String nama;
//   final String nim;
//   final String email;
//   final String jurusan;
//   final int semester;
//   final double ipk;
//   final String status; // Aktif / Tidak Aktif / Lulus

//   MahasiswaModel({
//     required this.nama,
//     required this.nim,
//     required this.email,
//     required this.jurusan,
//     required this.semester,
//     required this.ipk,
//     required this.status,
//   });

//   factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
//     return MahasiswaModel(
//       nama:     json['nama']     ?? '',
//       nim:      json['nim']      ?? '',
//       email:    json['email']    ?? '',
//       jurusan:  json['jurusan']  ?? '',
//       semester: json['semester'] ?? 1,
//       ipk:      (json['ipk'] ?? 0.0).toDouble(),
//       status:   json['status']   ?? 'Aktif',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'nama':     nama,
//     'nim':      nim,
//     'email':    email,
//     'jurusan':  jurusan,
//     'semester': semester,
//     'ipk':      ipk,
//     'status':   status,
//   };
// }

// Tm 5
/// Model mahasiswa yang di-mapping dari API /comments
class MahasiswaModel {
  final int    postId;   
  final int    id;       
  final String nama;     
  final String email;    
  final String body;    

  MahasiswaModel({
    required this.postId,
    required this.id,
    required this.nama,
    required this.email,
    required this.body,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      postId: json['postId'] ?? 0,
      id:     json['id']     ?? 0,
      nama:   json['name']   ?? '',
      email:  json['email']  ?? '',
      body:   json['body']   ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'postId': postId,
    'id':     id,
    'name':   nama,
    'email':  email,
    'body':   body,
  };

  /// NIM dari id
  String get nim => id.toString().padLeft(8, '0');

  /// Status berdasarkan postId
  String get status {
    if (postId <= 33)  return 'Aktif';
    if (postId <= 67)  return 'Tidak Aktif';
    return 'Lulus';
  }

  /// Semester dari postId
  int get semester => (postId % 8) + 1;

  /// IPK dummy berdasarkan id
  double get ipk => 2.5 + (id % 20) * 0.1;
}
