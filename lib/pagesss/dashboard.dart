import 'package:flutter/material.dart';
import 'package:belajar/pertemuan/pertemuan2.dart';
import 'package:belajar/pertemuan/pertemuan3.dart';
import 'package:belajar/pertemuan/pertemuan4.dart';
import 'package:belajar/pertemuan/pertemuan5.dart';
import 'package:belajar/pertemuan/pertemuan6.dart';
import 'package:belajar/pertemuan/pertemuan7.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {
      'title': 'Pertemuan 1',
      'subtitle': 'Materi Pertemuan 1',
      'icon': Icons.menu_book,
      'color': Colors.blue,
      'number': 1,
    },
    {
      'title': 'Pertemuan 2',
      'subtitle': 'Profile dan SnackBar',
      'icon': Icons.account_circle,
      'color': Colors.green,
      'number': 2,
    },
    {
      'title': 'Pertemuan 3',
      'subtitle': 'Bottom Navigation',
      'icon': Icons.navigation,
      'color': Colors.orange,
      'number': 3,
    },
    {
      'title': 'Pertemuan 4',
      'subtitle': 'Toast dan Alert Dialog',
      'icon': Icons.notifications_active,
      'color': Colors.purple,
      'number': 4,
    },
    {
      'title': 'Pertemuan 5',
      'subtitle': 'ListView',
      'icon': Icons.menu_book,
      'color': Colors.blue,
      'number': 5,
    },
    {
      'title': 'Pertemuan 6',
      'subtitle': 'Checkbox',
      'icon': Icons.menu_book,
      'color': Colors.green,
      'number': 6,
    },
    {
      'title': 'Pertemuan 7',
      'subtitle': 'Radio Button',
      'icon': Icons.menu_book,
      'color': Colors.orange,
      'number': 7,
    },
  ];

  Widget _getMeetingPage(int number) {
    switch (number) {
      case 2:
        return const PertemuanDua(title: 'Pertemuan 2');

      case 3:
        return const Pertemuan3();

      case 4:
        return const Pertemuan4Page();

      case 5:
        return ListViewPage();

      case 6:
        return CheckboxPage();

      case 7:
        return const RadiobuttonPage();

      default:
        return MeetingPlaceholderPage(number: number);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f5f8),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final Color color = item['color'] as Color;

          return Card(
            color: Colors.white,
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              leading: CircleAvatar(
                backgroundColor: color.withOpacity(0.12),
                child: Icon(item['icon'] as IconData, color: color),
              ),
              title: Text(
                item['title'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              subtitle: Text(item['subtitle'] as String),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                final int number = item['number'] as int;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _getMeetingPage(number),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MeetingPlaceholderPage extends StatelessWidget {
  final int number;

  const MeetingPlaceholderPage({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertemuan $number'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'Halaman Pertemuan $number\n'
          'Materi belum ditambahkan.',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
