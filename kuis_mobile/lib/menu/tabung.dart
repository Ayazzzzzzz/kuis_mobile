import 'package:flutter/material.dart';

class HitungTabung extends StatefulWidget {
  const HitungTabung({super.key});

  @override
  HitungTabungState createState() => HitungTabungState();
}

class HitungTabungState extends State<HitungTabung> {
  final TextEditingController jariJariController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  double? volume;
  double? keliling;
  String? errorMessage;

  void hitungTabung() {
    final double? r = double.tryParse(jariJariController.text);
    final double? t = double.tryParse(tinggiController.text);

    const double pi = 3.14159;
    if (r != null && t != null && r > 0 && t > 0) {
      setState(() {
        keliling = 2 * pi * r;
        volume = pi * r * r * t;
        errorMessage = null;
      });
    } else {
      setState(() {
        errorMessage = 'Harap masukkan angka yang valid.';
        volume = null;
        keliling = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Hitung Tabung'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('asset/tabung.png'),
            SizedBox(height: 20),
            TextField(
              controller: jariJariController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan jari-jari tabung',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan tinggi tabung',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungTabung,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: const Color.fromARGB(255, 108, 66, 35),
              ),
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            if (errorMessage != null)
              Text(errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 16)),
            if (volume != null && keliling != null) ...[
              Text('Volume: ${volume?.toStringAsFixed(2)} cm^3',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Keliling alas: ${keliling?.toStringAsFixed(2)} cm^2',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ]
          ],
        ),
      ),
    );
  }
}
