import 'package:d4tivokasi/core/network/dio_client.dart';
import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:dio/dio.dart';

// tm 5
/// Repository menggunakan Dio
// class MahasiswaRepositoryDio {
//   final Dio _dio = Dio(BaseOptions(
//     baseUrl: 'https://jsonplaceholder.typicode.com',
//     connectTimeout: const Duration(seconds: 10),
//     receiveTimeout: const Duration(seconds: 10),
//   ));

//   Future<List<MahasiswaModel>> getMahasiswaList() async {
//     final response = await _dio.get('/comments');
//     if (response.statusCode == 200) {
//       final List<dynamic> data = response.data;
//       return data.take(20).map((json) => MahasiswaModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Gagal memuat data mahasiswa: ${response.statusCode}');
//     }
//   }
// }


