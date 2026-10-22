import 'package:flutter/material.dart';

class Pertemuan4Page extends StatefulWidget {
  const Pertemuan4Page({super.key});

  @override
  State<Pertemuan4Page> createState() => _Pertemuan4PageState();
}

class _Pertemuan4PageState extends State<Pertemuan4Page> {
  void _showToast(String pesan, Color warna) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        backgroundColor: warna,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _submitData() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Submit'),
          content: const Text('Apakah kamu yakin ingin mengirim data?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(dialogContext);
                _showToast('Data berhasil disubmit!', Colors.green);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _deleteData() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Delete'),
          content: const Text('Apakah kamu yakin ingin menghapus data?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(dialogContext);
                _showToast('Data berhasil dihapus!', Colors.red);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showInformationDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: const Text(
            'Ini adalah contoh Alert Dialog pada Flutter '
            'untuk Pertemuan 4.',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f5f8),
      appBar: AppBar(
        title: const Text(
          'Pertemuan 4',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _submitData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 12,
                ),
              ),
              child: const Text('Submit'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _deleteData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 12,
                ),
              ),
              child: const Text('Delete'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _showInformationDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              child: const Text('Show Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
