import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MahasiswaModel(nama: 'Budi Santoso',     nim: '22010001', email: 'budi@student.ac.id',     jurusan: 'Teknik Informatika', semester: 6, ipk: 3.75, status: 'Aktif'),
      MahasiswaModel(nama: 'Sari Dewi',         nim: '22010002', email: 'sari@student.ac.id',     jurusan: 'Teknik Informatika', semester: 4, ipk: 3.50, status: 'Aktif'),
      MahasiswaModel(nama: 'Andi Wijaya',        nim: '21010003', email: 'andi@student.ac.id',     jurusan: 'Teknik Informatika', semester: 8, ipk: 3.90, status: 'Lulus'),
      MahasiswaModel(nama: 'Rini Hartati',       nim: '22010004', email: 'rini@student.ac.id',     jurusan: 'Teknik Informatika', semester: 2, ipk: 3.20, status: 'Aktif'),
      MahasiswaModel(nama: 'Dimas Pratama',      nim: '22010005', email: 'dimas@student.ac.id',    jurusan: 'Teknik Informatika', semester: 6, ipk: 2.80, status: 'Aktif'),
      MahasiswaModel(nama: 'Novi Rahayu',        nim: '21010006', email: 'novi@student.ac.id',     jurusan: 'Teknik Informatika', semester: 8, ipk: 3.60, status: 'Lulus'),
      MahasiswaModel(nama: 'Fajar Nugroho',      nim: '23010007', email: 'fajar@student.ac.id',    jurusan: 'Teknik Informatika', semester: 2, ipk: 3.10, status: 'Aktif'),
      MahasiswaModel(nama: 'Lestari Putri',      nim: '22010008', email: 'lestari@student.ac.id',  jurusan: 'Teknik Informatika', semester: 4, ipk: 3.40, status: 'Aktif'),
      MahasiswaModel(nama: 'Hendra Gunawan',     nim: '20010009', email: 'hendra@student.ac.id',   jurusan: 'Teknik Informatika', semester: 8, ipk: 2.50, status: 'Tidak Aktif'),
      MahasiswaModel(nama: 'Maya Sari',          nim: '22010010', email: 'maya@student.ac.id',     jurusan: 'Teknik Informatika', semester: 6, ipk: 3.85, status: 'Aktif'),
    ];
  }
}