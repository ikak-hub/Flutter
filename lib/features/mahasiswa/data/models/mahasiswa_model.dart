class MahasiswaModel {
  final String nama;
  final String nim;
  final String email;
  final String jurusan;
  final int semester;
  final double ipk;
  final String status; // Aktif / Tidak Aktif / Lulus

  MahasiswaModel({
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
    required this.semester,
    required this.ipk,
    required this.status,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      nama:     json['nama']     ?? '',
      nim:      json['nim']      ?? '',
      email:    json['email']    ?? '',
      jurusan:  json['jurusan']  ?? '',
      semester: json['semester'] ?? 1,
      ipk:      (json['ipk'] ?? 0.0).toDouble(),
      status:   json['status']   ?? 'Aktif',
    );
  }

  Map<String, dynamic> toJson() => {
    'nama':     nama,
    'nim':      nim,
    'email':    email,
    'jurusan':  jurusan,
    'semester': semester,
    'ipk':      ipk,
    'status':   status,
  };
}