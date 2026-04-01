// import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';

// class MahasiswaRepository {
//   Future<List<MahasiswaModel>> getMahasiswaList() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return [
//       MahasiswaModel(nama: 'Budi Santoso',     nim: '22010001', email: 'budi@student.ac.id',     jurusan: 'Teknik Informatika', semester: 6, ipk: 3.75, status: 'Aktif'),
//       MahasiswaModel(nama: 'Sari Dewi',         nim: '22010002', email: 'sari@student.ac.id',     jurusan: 'Teknik Informatika', semester: 4, ipk: 3.50, status: 'Aktif'),
//       MahasiswaModel(nama: 'Andi Wijaya',        nim: '21010003', email: 'andi@student.ac.id',     jurusan: 'Teknik Informatika', semester: 8, ipk: 3.90, status: 'Lulus'),
//       MahasiswaModel(nama: 'Rini Hartati',       nim: '22010004', email: 'rini@student.ac.id',     jurusan: 'Teknik Informatika', semester: 2, ipk: 3.20, status: 'Aktif'),
//       MahasiswaModel(nama: 'Dimas Pratama',      nim: '22010005', email: 'dimas@student.ac.id',    jurusan: 'Teknik Informatika', semester: 6, ipk: 2.80, status: 'Aktif'),
//       MahasiswaModel(nama: 'Novi Rahayu',        nim: '21010006', email: 'novi@student.ac.id',     jurusan: 'Teknik Informatika', semester: 8, ipk: 3.60, status: 'Lulus'),
//       MahasiswaModel(nama: 'Fajar Nugroho',      nim: '23010007', email: 'fajar@student.ac.id',    jurusan: 'Teknik Informatika', semester: 2, ipk: 3.10, status: 'Aktif'),
//       MahasiswaModel(nama: 'Lestari Putri',      nim: '22010008', email: 'lestari@student.ac.id',  jurusan: 'Teknik Informatika', semester: 4, ipk: 3.40, status: 'Aktif'),
//       MahasiswaModel(nama: 'Hendra Gunawan',     nim: '20010009', email: 'hendra@student.ac.id',   jurusan: 'Teknik Informatika', semester: 8, ipk: 2.50, status: 'Tidak Aktif'),
//       MahasiswaModel(nama: 'Maya Sari',          nim: '22010010', email: 'maya@student.ac.id',     jurusan: 'Teknik Informatika', semester: 6, ipk: 3.85, status: 'Aktif'),
//     ];
//   }
// }

// Tm 5
// import 'dart:convert';
// import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';
// import 'package:http/http.dart' as http;

// /// Repository menggunakan HTTP package
// class MahasiswaRepository {
//   Future<List<MahasiswaModel>> getMahasiswaList() async {
//     final response = await http.get(
//       Uri.parse('https://jsonplaceholder.typicode.com/comments'),
//       headers: {'Accept': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       // Ambil hanya 20 data pertama agar tidak terlalu banyak
//       return data.take(20).map((json) => MahasiswaModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Gagal memuat data mahasiswa: ${response.statusCode}');
//     }
//   }
// }

// TM 6
import 'package:d4tivokasi/core/network/dio_client.dart';
import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:dio/dio.dart';

class MahasiswaRepository {
  final DioClient _dioClient;

  MahasiswaRepository({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  /// Mendapatkan daftar mahasiswa dari API /comments menggunakan Dio
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final Response response = await _dioClient.dio.get('/users');
      final List<dynamic> data = response.data;
      return data.map((json) => MahasiswaModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(
        'Gagal memuat data mahasiswa: ${e.response?.statusCode} - ${e.message}',
      );
    }
  }
}


