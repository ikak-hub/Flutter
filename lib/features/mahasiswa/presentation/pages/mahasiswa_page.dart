// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:d4tivokasi/core/widgets/common_widgets.dart';
// import 'package:d4tivokasi/features/mahasiswa/presentation/providers/mahasiswa_provider.dart';
// import 'package:d4tivokasi/features/mahasiswa/presentation/widgets/mahasiswa_widget.dart';

// class MahasiswaPage extends ConsumerWidget {
//   const MahasiswaPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final mahasiswaState = ref.watch(mahasiswaNotifierProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Data Mahasiswa'),
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh_rounded),
//             onPressed: () => ref.invalidate(mahasiswaNotifierProvider),
//             tooltip: 'Refresh',
//           ),
//         ],
//       ),
//       body: mahasiswaState.when(
//         loading: () => const LoadingWidget(),
//         error: (error, stack) => CustomErrorWidget(
//           message: 'Gagal memuat data mahasiswa: ${error.toString()}',
//           onRetry: () =>
//               ref.read(mahasiswaNotifierProvider.notifier).refresh(),
//         ),
//         data: (mahasiswaList) {
//           // ringkasan total di atas list
//           return Column(
//             children: [
//               _SummaryBanner(total: mahasiswaList.length),
//               Expanded(
//                 child: MahasiswaListView(
//                   mahasiswaList: mahasiswaList,
//                   onRefresh: () => ref.invalidate(mahasiswaNotifierProvider),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class _SummaryBanner extends StatelessWidget {
//   final int total;
//   const _SummaryBanner({required this.total});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(
//             color: Theme.of(context).primaryColor.withOpacity(0.2)),
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.school_rounded,
//               color: Theme.of(context).primaryColor, size: 22),
//           const SizedBox(width: 10),
//           Text(
//             'Total: \$total Mahasiswa',
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               color: Theme.of(context).primaryColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Tm 7
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d4tivokasi/core/widgets/common_widgets.dart';
import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:d4tivokasi/features/mahasiswa/presentation/providers/mahasiswa_provider.dart';
import 'package:d4tivokasi/features/mahasiswa/presentation/widgets/mahasiswa_widget.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaState = ref.watch(mahasiswaNotifierProvider);
    final savedMahasiswa = ref.watch(savedMahasiswaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(mahasiswaNotifierProvider),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Section: Data Tersimpan di SharedPreferences ──────────────
          _SavedMahasiswaSection(savedMahasiswa: savedMahasiswa, ref: ref),

          // ── Section Title: Daftar Mahasiswa ───────────────────────────
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              'Daftar Mahasiswa',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          // ── Daftar Mahasiswa ──────────────────────────────────────────
          Expanded(
            child: mahasiswaState.when(
              loading: () => const LoadingWidget(),
              error: (error, stack) => CustomErrorWidget(
                message: 'Gagal memuat data mahasiswa: ${error.toString()}',
                onRetry: () {
                  ref.read(mahasiswaNotifierProvider.notifier).refresh();
                },
              ),
              data: (mahasiswaList) => _MahasiswaListWithSave(
                mahasiswaList: mahasiswaList,
                onRefresh: () => ref.invalidate(mahasiswaNotifierProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Widget: Section data SharedPreferences ────────────────────────────────────
class _SavedMahasiswaSection extends ConsumerWidget {
  final AsyncValue<List<Map<String, String>>> savedMahasiswa;
  final WidgetRef ref;

  const _SavedMahasiswaSection(
      {required this.savedMahasiswa, required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header dengan tombol hapus semua
          Row(
            children: [
              const Icon(Icons.storage_rounded, size: 16),
              const SizedBox(width: 6),
              const Text(
                'Data Tersimpan di Local Storage',
                style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              savedMahasiswa.maybeWhen(
                data: (users) => users.isNotEmpty
                    ? TextButton.icon(
                        onPressed: () async {
                          await ref
                              .read(mahasiswaNotifierProvider.notifier)
                              .clearSavedMahasiswa();
                          ref.invalidate(savedMahasiswaProvider);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Semua data tersimpan dihapus'),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.delete_sweep_outlined,
                            size: 14, color: Colors.red),
                        label: const Text('Hapus Semua',
                            style:
                                TextStyle(fontSize: 12, color: Colors.red)),
                      )
                    : const SizedBox.shrink(),
                orElse: () => const SizedBox.shrink(),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Content
          savedMahasiswa.maybeWhen(
            loading: () => const LinearProgressIndicator(),
            error: (_, __) => const Text(
              'Gagal membaca data tersimpan',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            data: (users) {
              if (users.isEmpty) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline,
                          size: 16, color: Colors.grey.shade400),
                      const SizedBox(width: 8),
                      Text(
                        'Belum ada data. Tap ikon 💾 untuk menyimpan.',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                );
              }

              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  separatorBuilder: (_, __) => Divider(
                      height: 1,
                      color: Colors.blue.shade100,
                      indent: 12,
                      endIndent: 12),
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      dense: true,
                      leading: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.blue.shade100,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(user['nama'] ?? '-'),
                      subtitle: Text(
                        'ID: ${user['mahasiswa_id']} • ${_formatDate(user['saved_at'] ?? '')}',
                        style: const TextStyle(fontSize: 11),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.close,
                            size: 16, color: Colors.red),
                        onPressed: () async {
                          await ref
                              .read(mahasiswaNotifierProvider.notifier)
                              .removeSavedMahasiswa(
                                  user['mahasiswa_id'] ?? '');
                          ref.invalidate(savedMahasiswaProvider);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${user['nama']} dihapus'),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  String _formatDate(String isoString) {
    if (isoString.isEmpty) return '-';
    try {
      final date = DateTime.parse(isoString);
      return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return isoString;
    }
  }
}

// ── Widget: List mahasiswa dengan tombol save ─────────────────────────────────
class _MahasiswaListWithSave extends ConsumerWidget {
  final List<MahasiswaModel> mahasiswaList;
  final VoidCallback onRefresh;

  const _MahasiswaListWithSave(
      {required this.mahasiswaList, required this.onRefresh});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        itemCount: mahasiswaList.length,
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        itemBuilder: (context, index) {
          final mahasiswa = mahasiswaList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${mahasiswa.id}'),
              ),
              title: Text(mahasiswa.nama),
              subtitle: Text(
                '${mahasiswa.email}\n${mahasiswa.body.length > 40 ? '${mahasiswa.body.substring(0, 40)}...' : mahasiswa.body}',
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.save, size: 18),
                tooltip: 'Simpan mahasiswa ini',
                onPressed: () async {
                  await ref
                      .read(mahasiswaNotifierProvider.notifier)
                      .saveSelectedMahasiswa(mahasiswa);
                  ref.invalidate(savedMahasiswaProvider);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '${mahasiswa.nama} berhasil disimpan ke local storage'),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
