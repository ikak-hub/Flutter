// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';
// import 'package:d4tivokasi/features/mahasiswa/data/repositories/mahasiswa_repository.dart';

// final mahasiswaRepositoryProvider = Provider<MahasiswaRepository>(
//     (ref) => MahasiswaRepository());

// class MahasiswaNotifier
//     extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
//   final MahasiswaRepository _repository;

//   MahasiswaNotifier(this._repository) : super(const AsyncValue.loading()) {
//     loadMahasiswaList();
//   }

//   Future<void> loadMahasiswaList() async {
//     state = const AsyncValue.loading();
//     try {
//       final data = await _repository.getMahasiswaList();
//       state = AsyncValue.data(data);
//     } catch (error, stackTrace) {
//       state = AsyncValue.error(error, stackTrace);
//     }
//   }

//   Future<void> refresh() async => loadMahasiswaList();
// }

// final mahasiswaNotifierProvider = StateNotifierProvider.autoDispose<
//     MahasiswaNotifier, AsyncValue<List<MahasiswaModel>>>((ref) {
//   return MahasiswaNotifier(ref.watch(mahasiswaRepositoryProvider));
// });

// TM 7
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d4tivokasi/core/services/local_storage_service.dart';
import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:d4tivokasi/features/mahasiswa/data/repositories/mahasiswa_repository.dart';

// Repository Provider
final mahasiswaRepositoryProvider =
    Provider<MahasiswaRepository>((ref) => MahasiswaRepository());

// LocalStorageService Provider
final localStorageServiceProvider =
    Provider<LocalStorageService>((ref) => LocalStorageService());

// Provider semua mahasiswa yang disimpan
final savedMahasiswaProvider =
    FutureProvider<List<Map<String, String>>>((ref) async {
  final storage = ref.watch(localStorageServiceProvider);
  return storage.getSavedMahasiswa();
});

// Provider untuk membaca saved user dari local storage
final savedUserProvider =
    FutureProvider<Map<String, String?>>((ref) async {
  final storage  = ref.watch(localStorageServiceProvider);
  final userId   = await storage.getUserId();
  final username = await storage.getUsername();
  final token    = await storage.getToken();
  return {'userId': userId, 'username': username, 'token': token};
});

// StateNotifier untuk mengelola state mahasiswa
class MahasiswaNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
  final MahasiswaRepository  _repository;
  final LocalStorageService  _storage;

  MahasiswaNotifier(this._repository, this._storage)
      : super(const AsyncValue.loading()) {
    loadMahasiswaList();
  }

  Future<void> loadMahasiswaList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async => loadMahasiswaList();

  /// Simpan mahasiswa yang dipilih ke local storage
  Future<void> saveSelectedMahasiswa(MahasiswaModel mahasiswa) async {
    await _storage.addMahasiswaToSavedList(
      mahasiswaId: mahasiswa.id.toString(),
      nama:        mahasiswa.nama,
      email:       mahasiswa.email,
    );
  }

  /// Hapus mahasiswa tertentu dari list
  Future<void> removeSavedMahasiswa(String mahasiswaId) async {
    await _storage.removeSavedMahasiswa(mahasiswaId);
  }

  /// Hapus semua mahasiswa dari list
  Future<void> clearSavedMahasiswa() async {
    await _storage.clearSavedMahasiswa();
  }
}

// Mahasiswa Notifier Provider
final mahasiswaNotifierProvider = StateNotifierProvider.autoDispose<
    MahasiswaNotifier, AsyncValue<List<MahasiswaModel>>>((ref) {
  final repository = ref.watch(mahasiswaRepositoryProvider);
  final storage    = ref.watch(localStorageServiceProvider);
  return MahasiswaNotifier(repository, storage);
});
