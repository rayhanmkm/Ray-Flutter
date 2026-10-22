import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Identitas mahasiswa
  final String nama = 'Muhammad Rayhan Atallah';
  final String nim = '241011700115';
  final String kelas = '04SIFK001';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f5f8),

      // APP BAR
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      // KONTEN PROFILE
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FOTO MAHASISWA
              CircleAvatar(
                radius: 60,
                backgroundColor: const Color(0xffe3f2fd),
                backgroundImage: const AssetImage('assets/images/rayhan.png'),
              ),

              const SizedBox(height: 20),

              // NAMA MAHASISWA
              Text(
                nama,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Mahasiswa',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),

              const SizedBox(height: 28),

              // NIM
              _buildProfileInfo(
                icon: Icons.badge_outlined,
                label: 'NIM',
                value: nim,
              ),

              const SizedBox(height: 14),

              // KELAS
              _buildProfileInfo(
                icon: Icons.school_outlined,
                label: 'Kelas',
                value: kelas,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET INFORMASI MAHASISWA
  Widget _buildProfileInfo({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
