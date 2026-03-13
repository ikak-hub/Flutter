// import 'package:d4tivokasi/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

// class MahasiswaAktifRepository {
//   Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return [
//       MahasiswaAktifModel(nama: 'Budi Santoso',  nim: '22010001', email: 'budi@student.ac.id',    jurusan: 'Teknik Informatika', semester: 6, ipk: 3.75, angkatan: '2022', kelas: 'TI-A'),
//       MahasiswaAktifModel(nama: 'Sari Dewi',      nim: '22010002', email: 'sari@student.ac.id',    jurusan: 'Teknik Informatika', semester: 4, ipk: 3.50, angkatan: '2022', kelas: 'TI-B'),
//       MahasiswaAktifModel(nama: 'Rini Hartati',   nim: '22010004', email: 'rini@student.ac.id',    jurusan: 'Teknik Informatika', semester: 2, ipk: 3.20, angkatan: '2022', kelas: 'TI-A'),
//       MahasiswaAktifModel(nama: 'Dimas Pratama',  nim: '22010005', email: 'dimas@student.ac.id',   jurusan: 'Teknik Informatika', semester: 6, ipk: 2.80, angkatan: '2022', kelas: 'TI-C'),
//       MahasiswaAktifModel(nama: 'Fajar Nugroho',  nim: '23010007', email: 'fajar@student.ac.id',   jurusan: 'Teknik Informatika', semester: 2, ipk: 3.10, angkatan: '2023', kelas: 'TI-A'),
//       MahasiswaAktifModel(nama: 'Lestari Putri',  nim: '22010008', email: 'lestari@student.ac.id', jurusan: 'Teknik Informatika', semester: 4, ipk: 3.40, angkatan: '2022', kelas: 'TI-B'),
//       MahasiswaAktifModel(nama: 'Maya Sari',      nim: '22010010', email: 'maya@student.ac.id',    jurusan: 'Teknik Informatika', semester: 6, ipk: 3.85, angkatan: '2022', kelas: 'TI-A'),
//     ];
//   }
// }

// Tm 5
import 'dart:convert';
import 'package:d4tivokasi/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:http/http.dart' as http;

/// Repository menggunakan HTTP package
class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      // Ambil hanya 15 data pertama
      return data.take(15).map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data mahasiswa aktif: ${response.statusCode}');
    }
  }
}


