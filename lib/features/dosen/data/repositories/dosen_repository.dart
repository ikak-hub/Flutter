// import 'dart:convert';
// import 'package:d4tivokasi/features/dosen/data/models/dosen_model.dart';
// import 'package:http/http.dart' as http;

// class DosenRepository {
//   /// Mendapatkan daftar dosen
//   Future<List<DosenModel>> getDosenList() async {
//     final response = await http.get(
//       Uri.parse ('https://jsonplaceholder.typicode.com/users'),
//       headers: {'Accept': 'application/json'},
//       );
//       if (response.statusCode == 200){
//         final List<dynamic> data = jsonDecode(response.body);
//         print(data);
//         return data.map((json) => DosenModel.fromJson(json)).toList();
//       } else {
//         print('Error: ${response.statusCode} - ${response.body}');
//         throw Exception('Gagal memuat data dosen: ${response.statusCode}');
//       }
//   }
// }

// Tm 6
import 'package:d4tivokasi/core/network/dio_client.dart';
import 'package:d4tivokasi/features/dosen/data/models/dosen_model.dart';
import 'package:dio/dio.dart';

class DosenRepository {
  final DioClient _dioClient;

  DosenRepository({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  /// Mendapatkan daftar dosen
  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dioClient.dio.get('/users');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data);
        return data.map((json) => DosenModel.fromJson(json)).toList();
      } else {
        print('Error: ${response.statusCode} - ${response.data}');
        throw Exception('Gagal memuat data dosen: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      throw Exception('Gagal memuat data dosen: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Terjadi kesalahan tak terduga saat memuat data dosen.');
    }
  }
}

