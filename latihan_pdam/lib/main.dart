import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController idPelangganController = TextEditingController();
  TextEditingController namaPelangganController = TextEditingController();
  TextEditingController meteranAwalController = TextEditingController();
  TextEditingController meteranAkhirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 400,
                height: 150,
                child: Image.asset(
                  "images/pdam.jpg",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 400,
                height: 60,
                color: Colors.amberAccent,
                child: Center(
                  child: Text(
                    "PDAM PADANG",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "ID Pelanggan",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: idPelangganController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Nama Pelanggan",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: namaPelangganController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Meteran Awal",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: meteranAwalController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Meteran Akhir",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: meteranAkhirController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Proses perhitungan atau navigasi ke halaman hasil di sini
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return HasilPage(
                            idPelanggan: idPelangganController.text,
                            namaPelanggan: namaPelangganController.text,
                            meteranAwal: int.parse(meteranAwalController.text),
                            meteranAkhir:
                                int.parse(meteranAkhirController.text),
                          );
                        },
                      ),
                    );
                  },
                  child: Text("Proses"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HasilPage extends StatelessWidget {
  final String idPelanggan;
  final String namaPelanggan;
  final int meteranAwal;
  final int meteranAkhir;

  HasilPage({
    required this.idPelanggan,
    required this.namaPelanggan,
    required this.meteranAwal,
    required this.meteranAkhir,
  });

  @override
  Widget build(BuildContext context) {
    // Proses perhitungan atau tampilkan hasil di sini
    int totalMeteran = meteranAkhir - meteranAwal;
    double totalBiaya = totalMeteran * 5000.0; // Biaya per meteran
    double pajak = totalBiaya * 0.05; // 5% pajak
    double totalPembayaran = totalBiaya + pajak;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID Pelanggan    : $idPelanggan"),
            SizedBox(height: 10),
            Text("Nama Pelanggan  : $namaPelanggan"),
            SizedBox(height: 10),
            Text("Total Meteran   : $totalMeteran"),
            SizedBox(height: 10),
            Text("Total Biaya     : Rp. $totalBiaya"),
            SizedBox(height: 10),
            Text("Pajak           : Rp. $pajak"),
            SizedBox(height: 10),
            Text("Total Pembayaran: Rp. $totalPembayaran"),
            SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Back"),
      ),
    );
  }
}
