import 'package:d4tivokasi/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:dio/dio.dart';
//Tm 5
// Repository menggunakan Dio
class MahasiswaAktifRepositoryDio {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    final response = await _dio.get('/posts');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.take(15).map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat: ${response.statusCode}');
    }
  }
}