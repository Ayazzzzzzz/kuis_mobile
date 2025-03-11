import 'package:flutter/material.dart';

class HariPage extends StatefulWidget {
  const HariPage({super.key});

  @override
  HariPageState createState() => HariPageState();
}

class HariPageState extends State<HariPage> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = '';
  String? errorMessage;

  final Map<int, String> hari = {
    1: 'Senin',
    2: 'Selasa',
    3: 'Rabu',
    4: 'Kamis',
    5: 'Jumat',
    6: 'Sabtu',
    7: 'Minggu',
  };

  void _hitungHari() {
    final int? input = int.tryParse(_controller.text);
    if (input != null && hari.containsKey(input)) {
      setState(() {
        _hasil = 'Hari ini adalah hari ${hari[input]}';
        errorMessage = null;
      });
    } else if (input == null) {
      setState(() {
        errorMessage = 'Masukkan angka (1-7) terlebih dahulu';
        _hasil = '';
      });
    } else {
      setState(() {
        _hasil = '';
        errorMessage = 'Input harus angka 1-7';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('Perhitungan Hari'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan angka (1-7)',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _hitungHari,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[400],
                foregroundColor: const Color.fromARGB(255, 35, 53, 108),
              ),
              child: Text('Hitung Hari'),
            ),
            SizedBox(height: 40),
            if (errorMessage != null)
              Text(errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 16)),
            Text(
              _hasil,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 25, 33, 56)),
            ),
          ],
        ),
      ),
    );
  }
}
