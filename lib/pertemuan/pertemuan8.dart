import 'package:flutter/material.dart';

class AutocompletespinPage extends StatelessWidget {
  const AutocompletespinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> pilihan = ['Flutter', 'Dart', 'Java', 'Python', 'HTML'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 8'),
        backgroundColor: Colors.purple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const Text(
              'Materi Pertemuan 8',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }

                return pilihan.where((String item) {
                  return item.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  );
                });
              },

              onSelected: (String selection) {
                print('Kamu memilih: $selection');
              },

              fieldViewBuilder:
                  (context, controller, focusNode, onEditingComplete) {
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,

                      decoration: const InputDecoration(
                        labelText: 'Pilih materi',
                        border: OutlineInputBorder(),
                      ),
                    );
                  },
            ),
          ],
        ),
      ),
    );
  }
}
