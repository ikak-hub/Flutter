import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d4tivokasi/core/widgets/common_widgets.dart';
import 'package:d4tivokasi/features/mahasiswa_aktif/presentation/providers/mahasiswa_aktif_provider.dart';
import 'package:d4tivokasi/features/mahasiswa_aktif/presentation/widgets/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa Aktif'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(mahasiswaAktifNotifierProvider),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat: ${error.toString()}',
          onRetry: () =>
              ref.read(mahasiswaAktifNotifierProvider.notifier).refresh(),
        ),
        data: (list) {
          return Column(
            children: [
              _ActiveBanner(total: list.length),
              Expanded(
                child: MahasiswaAktifListView(
                  list: list,
                  onRefresh: () =>
                      ref.invalidate(mahasiswaAktifNotifierProvider),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ActiveBanner extends StatelessWidget {
  final int total;
  const _ActiveBanner({required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.15),
            Colors.green.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 22),
          const SizedBox(width: 10),
          Text(
            '\$total Mahasiswa Aktif',
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.green),
          ),
        ],
      ),
    );
  }
}