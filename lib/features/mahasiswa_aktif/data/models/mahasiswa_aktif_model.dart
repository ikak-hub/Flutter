class MahasiswaAktifModel {
  final String nama;
  final String nim;
  final String email;
  final String jurusan;
  final int semester;
  final double ipk;
  final String angkatan;
  final String kelas;

  MahasiswaAktifModel({
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
    required this.semester,
    required this.ipk,
    required this.angkatan,
    required this.kelas,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      nama:      json['nama']      ?? '',
      nim:       json['nim']       ?? '',
      email:     json['email']     ?? '',
      jurusan:   json['jurusan']   ?? '',
      semester:  json['semester']  ?? 1,
      ipk:       (json['ipk'] ?? 0.0).toDouble(),
      angkatan:  json['angkatan']  ?? '',
      kelas:     json['kelas']     ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'nama':     nama,
    'nim':      nim,
    'email':    email,
    'jurusan':  jurusan,
    'semester': semester,
    'ipk':      ipk,
    'angkatan': angkatan,
    'kelas':    kelas,
  };
}