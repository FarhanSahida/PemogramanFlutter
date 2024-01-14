import 'package:flutter/material.dart';
import 'package:latihan_pegawai/uts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedGolongan = 'IIIA'; // Nilai default
  int gajiPokok = 1000000; // Nilai default

  // Daftar pilihan golongan
  List<String> golonganList = ['IIIA', 'IIIB', 'IIIC'];
  TextEditingController nipController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  String tanggal = ""; // Variabel tanggal

  // Fungsi untuk menampilkan date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now())
      setState(() {
        tanggal = picked.toString().substring(0, 10);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan 26/10"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    "Gaji Pokok",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Title("Golongan"),
              Padding(
                padding: const EdgeInsets.all(10),
                child: DropdownButton(
                  value: selectedGolongan,
                  items: golonganList.map((String golongan) {
                    return DropdownMenuItem(
                      value: golongan,
                      child: Text(
                        golongan,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGolongan = value.toString();
                      if (selectedGolongan == 'IIIA') {
                        gajiPokok = 1000000;
                      } else if (selectedGolongan == 'IIIB') {
                        gajiPokok = 2000000;
                      } else if (selectedGolongan == 'IIIC') {
                        gajiPokok = 3000000;
                      }
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Title("NIP"),
              TextField(controller: nipController),
              SizedBox(height: 20.0),
              Title("Nama"),
              TextField(controller: namaController),
              SizedBox(height: 20.0),
              Title("Alamat"),
              TextField(controller: alamatController),
              SizedBox(height: 20.0),
              Title("Tanggal"),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(tanggal),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          double tunj_istri = 0.05 * gajiPokok;
          double tunj_anak = 0.05 * gajiPokok;
          double gajiBersih = gajiPokok + tunj_istri + tunj_anak;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HasilPage(
              nip: nipController.text,
              nama: namaController.text,
              alamat: alamatController.text,
              gol: selectedGolongan,
              tunj_istri: tunj_istri,
              tunj_anak: tunj_anak,
              tanggal: tanggal,
              gajipokok: double.parse(gajiPokok.toString()),
              gajiBersih: gajiBersih,
            ),
          ));
        },
        child: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}

class HasilPage extends StatelessWidget {
  final String nip;
  final String nama;
  final String alamat;
  final String gol;
  final double tunj_istri;
  final double tunj_anak;
  final String tanggal;
  final double gajipokok;
  final double gajiBersih;

  HasilPage(
      {required this.nip,
      required this.nama,
      required this.alamat,
      required this.gol,
      required this.tunj_istri,
      required this.tunj_anak,
      required this.tanggal,
      required this.gajipokok,
      required this.gajiBersih});
  @override
  Widget build(BuildContext context) {
    const space = SizedBox(
      height: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.amber,
              child: Center(
                child: Text(
                  "Hasil",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            space,
            Text(
              "NIP: $nip",
              style: TextStyle(fontSize: 18),
            ),
            space,
            Text(
              "Nama: $nama",
              style: TextStyle(fontSize: 18),
            ),
            space,
            Text(
              "Alamat: $alamat",
              style: TextStyle(fontSize: 18),
            ),
            space,
            Text(
              "Golongan: $gol",
              style: TextStyle(fontSize: 18),
            ),
            space,
            Text(
              "Tunjangan Istri: Rp.$tunj_istri",
              style: TextStyle(fontSize: 18),
            ),
            space,
            Text(
              "Tunjangan Anak: Rp.$tunj_anak",
              style: TextStyle(fontSize: 18),
            ),
            space,
            Text(
              "Tanggal: $tanggal",
              style: TextStyle(fontSize: 18),
            ),
            space,
            Text(
              "Gapok: Rp.$gajipokok",
              style: TextStyle(fontSize: 18),
            ),
            space,
            Text(
              "Gaji bersih: Rp.$gajiBersih",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String judul;
  const Title(this.judul);

  @override
  Widget build(BuildContext context) {
    return Text(
      judul,
      style: TextStyle(fontSize: 20),
    );
  }
}
