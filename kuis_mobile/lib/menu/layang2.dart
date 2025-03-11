import 'package:flutter/material.dart';

class HitungLayangLayang extends StatefulWidget {
  const HitungLayangLayang({super.key});

  @override
  HitungLayangLayangState createState() => HitungLayangLayangState();
}

class HitungLayangLayangState extends State<HitungLayangLayang> {
  final TextEditingController diagonal1Controller = TextEditingController();
  final TextEditingController diagonal2Controller = TextEditingController();
  final TextEditingController sisiAController = TextEditingController();
  final TextEditingController sisiBController = TextEditingController();
  double? luas;
  double? keliling;
  String? errorMessage;

  void hitungLayangLayang() {
    final diagonal1 = double.tryParse(diagonal1Controller.text);
    final diagonal2 = double.tryParse(diagonal2Controller.text);
    final sisiA = double.tryParse(sisiAController.text);
    final sisiB = double.tryParse(sisiBController.text);

    if (diagonal1 != null &&
        diagonal2 != null &&
        sisiA != null &&
        sisiB != null) {
      setState(() {
        luas = 0.5 * diagonal1 * diagonal2;
        keliling = 2 * (sisiA + sisiB);
        errorMessage = null;
      });
    } else {
      setState(() {
        errorMessage = 'Masukkan angka yang valid di semua kolom.';
        luas = null;
        keliling = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('Perhitungan Layang-Layang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('asset/layang2.png', height: 180),
              SizedBox(height: 20),
              TextField(
                controller: diagonal1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan panjang diagonal 1',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: diagonal2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan panjang diagonal 2',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: sisiAController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan panjang sisi A',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: sisiBController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan panjang sisi B',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: hitungLayangLayang,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
                child: Text('Hitung'),
              ),
              SizedBox(height: 20),
              if (errorMessage != null)
                Text(errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 16)),
              if (luas != null && keliling != null) ...[
                Text('Luas: ${luas?.toStringAsFixed(2)} cm^2',
                    style: TextStyle(fontSize: 18)),
                Text('Keliling: ${keliling?.toStringAsFixed(2)} cm^2',
                    style: TextStyle(fontSize: 18)),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
