import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d4tivokasi/core/constants/app_constants.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header SliverAppBar
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: AppConstants.gradientPurple,
                  ),
                ),
                child: const SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 16),
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, size: 60, color: Colors.white),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Admin D4TI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Administrator',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  // Info Section
                  _SectionTitle(title: 'Informasi Akun'),
                  _ProfileTile(
                    icon: Icons.person_outline,
                    label: 'Nama',
                    value: 'Admin D4TI',
                    gradientColors: AppConstants.gradientPurple,
                  ),
                  _ProfileTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: 'admin@d4ti.ac.id',
                    gradientColors: AppConstants.gradientPink,
                  ),
                  _ProfileTile(
                    icon: Icons.badge_outlined,
                    label: 'Role',
                    value: 'Administrator',
                    gradientColors: AppConstants.gradientBlue,
                  ),
                  const SizedBox(height: 16),
                  // Program Info
                  _SectionTitle(title: 'Informasi Program Studi'),
                  _ProfileTile(
                    icon: Icons.school_outlined,
                    label: 'Program Studi',
                    value: 'D4 Teknik Informatika Vokasi',
                    gradientColors: AppConstants.gradientGreen,
                  ),
                  _ProfileTile(
                    icon: Icons.account_balance_outlined,
                    label: 'Fakultas',
                    value: 'Vokasi',
                    gradientColors: AppConstants.gradientPurple,
                  ),
                  _ProfileTile(
                    icon: Icons.location_on_outlined,
                    label: 'Universitas',
                    value: 'Universitas Airlangga',
                    gradientColors: AppConstants.gradientPink,
                  ),
                  const SizedBox(height: 24),
                  // Stats summary
                  _SectionTitle(title: 'Ringkasan'),
                  Row(
                    children: [
                      Expanded(
                        child: _StatSummaryCard(
                          value: '1,200',
                          label: 'Mahasiswa',
                          icon: Icons.school_rounded,
                          colors: AppConstants.gradientPurple,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatSummaryCard(
                          value: '550',
                          label: 'Aktif',
                          icon: Icons.person_rounded,
                          colors: AppConstants.gradientPink,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatSummaryCard(
                          value: '650',
                          label: 'Dosen',
                          icon: Icons.people_rounded,
                          colors: AppConstants.gradientBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.3)),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final List<Color> gradientColors;

  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: gradientColors[0].withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 3)),
        ],
        border: Border.all(color: gradientColors[0].withOpacity(0.1)),
      ),
      child: ListTile(
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: gradientColors),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        title: Text(label,
            style: TextStyle(fontSize: 12, color: Colors.grey[500])),
        subtitle: Text(value,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
      ),
    );
  }
}

class _StatSummaryCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final List<Color> colors;

  const _StatSummaryCard({
    required this.value,
    required this.label,
    required this.icon,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: colors[0].withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text(label,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 11)),
        ],
      ),
    );
  }
}