import 'package:flutter/material.dart';

class RadiobuttonPage extends StatefulWidget {
  const RadiobuttonPage({super.key});

  @override
  State<RadiobuttonPage> createState() => _RadiobuttonPageState();
}

class _RadiobuttonPageState extends State<RadiobuttonPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _umurController = TextEditingController();

  String? _jenisKelamin;
  String? _pekerjaan;
  String? _tipePekerjaan;

  final List<String> pekerjaanList = [
    'Admin',
    'Guru',
    'Programmer',
    'Pengusaha',
    'Desainer',
  ];

  final List<String> tipePekerjaanList = [
    'Full Time',
    'Part Time',
    'Freelance',
    'Kontrak',
  ];

  @override
  void dispose() {
    _namaController.dispose();
    _umurController.dispose();
    super.dispose();
  }

  void _simpanData() {
    if (!_formKey.currentState!.validate()) return;

    if (_jenisKelamin == null || _pekerjaan == null || _tipePekerjaan == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan lengkapi semua pilihan!')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Data Berhasil Disimpan'),
        content: Text(
          'Nama: ${_namaController.text}\n'
          'Umur: ${_umurController.text} tahun\n'
          'Jenis Kelamin: $_jenisKelamin\n'
          'Pekerjaan: $_pekerjaan\n'
          'Tipe Pekerjaan: $_tipePekerjaan',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _namaController.clear();
    _umurController.clear();

    setState(() {
      _jenisKelamin = null;
      _pekerjaan = null;
      _tipePekerjaan = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Form dengan RadioButton',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF00897B),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _judulBagian('Data Diri'),
              const SizedBox(height: 12),

              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  hintText: 'Masukkan nama lengkap',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _umurController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Umur',
                  hintText: 'Masukkan umur',
                  prefixIcon: Icon(Icons.cake_outlined),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  final umur = int.tryParse(value ?? '');
                  if (umur == null || umur < 17 || umur > 100) {
                    return 'Umur harus antara 17–100 tahun';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),
              _judulBagian('Jenis Kelamin'),

              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    RadioListTile<String>(
                      title: const Text('Laki-laki'),
                      secondary: const Icon(Icons.male, color: Colors.blue),
                      value: 'Laki-laki',
                      groupValue: _jenisKelamin,
                      activeColor: Colors.teal,
                      onChanged: (value) {
                        setState(() {
                          _jenisKelamin = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Perempuan'),
                      secondary: const Icon(Icons.female, color: Colors.pink),
                      value: 'Perempuan',
                      groupValue: _jenisKelamin,
                      activeColor: Colors.teal,
                      onChanged: (value) {
                        setState(() {
                          _jenisKelamin = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              _judulBagian('Pekerjaan'),

              Card(
                color: Colors.white,
                child: Column(
                  children: pekerjaanList.map((pekerjaan) {
                    return RadioListTile<String>(
                      title: Text(pekerjaan),
                      value: pekerjaan,
                      groupValue: _pekerjaan,
                      activeColor: Colors.teal,
                      onChanged: (value) {
                        setState(() {
                          _pekerjaan = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 24),
              _judulBagian('Tipe Pekerjaan'),

              Card(
                color: Colors.white,
                child: Column(
                  children: tipePekerjaanList.map((tipe) {
                    return RadioListTile<String>(
                      title: Text(tipe),
                      value: tipe,
                      groupValue: _tipePekerjaan,
                      activeColor: Colors.teal,
                      onChanged: (value) {
                        setState(() {
                          _tipePekerjaan = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 28),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _simpanData,
                      icon: const Icon(Icons.save),
                      label: const Text('Simpan Data'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _resetForm,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _judulBagian(String judul) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        judul,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF00897B),
        ),
      ),
    );
  }
}
