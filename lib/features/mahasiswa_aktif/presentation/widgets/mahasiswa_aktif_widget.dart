import 'package:flutter/material.dart';
import 'package:d4tivokasi/core/constants/app_constants.dart';
import 'package:d4tivokasi/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifListView extends StatelessWidget {
  final List<MahasiswaAktifModel> list;
  final VoidCallback? onRefresh;

  const MahasiswaAktifListView({super.key, required this.list, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return const Center(child: Text('Tidak ada data mahasiswa aktif'));
    }
    return RefreshIndicator(
      onRefresh: () async => onRefresh?.call(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return MahasiswaAktifCard(
            mahasiswa: list[index],
            gradientColors: AppConstants.dashboardGradients[
                index % AppConstants.dashboardGradients.length],
          );
        },
      ),
    );
  }
}

class MahasiswaAktifCard extends StatelessWidget {
  final MahasiswaAktifModel mahasiswa;
  final List<Color>? gradientColors;

  const MahasiswaAktifCard({
    super.key,
    required this.mahasiswa,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ??
        [Theme.of(context).primaryColor,
         Theme.of(context).primaryColor.withOpacity(0.7)];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colors[0].withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: colors[0].withOpacity(0.15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  mahasiswa.nama.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mahasiswa.nama,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  _row(Icons.badge_outlined, 'NIM: ${mahasiswa.nim}'),
                  const SizedBox(height: 2),
                  _row(Icons.email_outlined, mahasiswa.email),
                  const SizedBox(height: 2),
                  Row(children: [
                    _row(Icons.class_outlined, 'Kelas: ${mahasiswa.kelas}'),
                    const SizedBox(width: 10),
                    _row(Icons.calendar_month_outlined,
                        'Sem ${mahasiswa.semester}'),
                  ]),
                ],
              ),
            ),
            // IPK badge
            Column(
              children: [
                Text('IPK', style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: colors),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    mahasiswa.ipk.toStringAsFixed(2),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: Colors.grey[500]),
        const SizedBox(width: 4),
        Text(text,
            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
      ],
    );
  }
}