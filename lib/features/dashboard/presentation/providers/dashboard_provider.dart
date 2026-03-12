import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d4tivokasi/features/dashboard/data/models/dashboard_model.dart';
import 'package:d4tivokasi/features/dashboard/data/repositories/dashboard_repository.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository();
});

/// StateNotifier untuk mengelola state dashboard
class DashboardNotifier
    extends StateNotifier<AsyncValue<DashboardData>> {
  final DashboardRepository _repository;

  DashboardNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getDashboardData();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.refreshDashboard();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void updateUserName(String newName) {
    state.whenData((data) {
      state = AsyncValue.data(data.copyWith(userName: newName));
    });
  }
}

/// Dashboard Notifier Provider dengan autoDispose
final dashboardNotifierProvider = StateNotifierProvider.autoDispose<
    DashboardNotifier, AsyncValue<DashboardData>>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return DashboardNotifier(repository);
});

/// Selected Stat Provider
final selectedStatIndexProvider = StateProvider<int>((ref) => 0);

/// Theme Mode Provider
final themeModeProvider = StateProvider<bool>(
  (ref) => false, // false = light, true = dark
);