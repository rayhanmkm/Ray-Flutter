import 'package:flutter/material.dart';

class PertemuanDua extends StatefulWidget {
  const PertemuanDua({super.key, required this.title});

  final String title;

  @override
  State<PertemuanDua> createState() => _PertemuanDua();
}

class _PertemuanDua extends State<PertemuanDua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 2'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 10),
            const Text(
              'Halo, Muhammad Rayhan Atallah',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Halo ada apa!')));
              },
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
