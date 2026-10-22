import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  ListViewPage({super.key});

  final List<String> items = [
    'Item ke-0',
    'Item ke-1',
    'Item ke-2',
    'Item ke-3',
    'Item ke-4',
    'Item ke-5',
    'Item ke-6',
    'Item ke-7',
    'Item ke-8',
    'Item ke-9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f5f8),

      appBar: AppBar(
        title: const Text(
          'ListView Flutter',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.star, color: Colors.blueAccent),
            title: Text(items[index]),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${items[index]} dipilih'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
