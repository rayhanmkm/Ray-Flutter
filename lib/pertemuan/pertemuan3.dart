import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Pertemuan3 extends StatefulWidget {
  const Pertemuan3({super.key});

  @override
  State<Pertemuan3> createState() => _Pertemuan3State();
}

class _Pertemuan3State extends State<Pertemuan3> {
  final List<Widget> _pages = [
    Container(color: Colors.red),
    Container(color: Colors.blueAccent),
    Container(color: Colors.blueGrey),
    Container(color: Colors.grey),
    Container(color: Colors.greenAccent),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 3'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Kembali ke Dashboard',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: _pages[_currentIndex],

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Beranda'),
            selectedColor: Colors.red,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.calendar_month),
            title: const Text('Kalender'),
            selectedColor: Colors.blueAccent,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.approval_rounded),
            title: const Text('Maps'),
            selectedColor: Colors.blueGrey,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Search'),
            selectedColor: Colors.grey,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile'),
            selectedColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
