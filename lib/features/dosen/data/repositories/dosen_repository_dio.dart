import 'package:d4tivokasi/features/dosen/data/models/dosen_model.dart';
import 'package:dio/dio.dart';

// tm 5
class DosenRepositoryDio {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com/users',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Accept': 'application/json'},
  ));

  /// Mendapatkan daftar dosen dari REST API menggunakan Dio
  Future<List<DosenModel>> getDosenList() async {
    final response = await _dio.get('/users');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data dosen: ${response.statusCode}');
    }
  }
}
