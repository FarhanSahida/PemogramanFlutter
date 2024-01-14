import 'package:flutter/material.dart';

class MyAPPUTS extends StatelessWidget {
  const MyAPPUTS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppUTS(),
    );
  }
}

class MyAppUTS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController KodeBarang = TextEditingController();
    TextEditingController namaBarang = TextEditingController();
    TextEditingController harga = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('uts'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Kode Barang"),
          TextField(
            controller: KodeBarang,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Nama Barang"),
          TextField(
            controller: namaBarang,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Harga"),
          TextField(
            controller: harga,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          double total = 0;
          if (double.parse(harga.text) > 10000) {
            total =
                double.parse(harga.text) - (double.parse(harga.text) * 0.02);
          } else {
            total = 0;
          }

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyResult(
              kode: KodeBarang.text,
              nama: namaBarang.text,
              harga: double.parse(harga.text),
              total: total,
            ),
          ));
        },
        child: Text("Hasil"),
      ),
    );
  }
}

class MyResult extends StatelessWidget {
  String kode;
  String nama;
  double harga;
  double total;

  MyResult({
    required this.kode,
    required this.nama,
    required this.harga,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil"),
      ),
      body: Column(
        children: [
          Text("Kode Barang : $kode"),
          SizedBox(
            height: 20,
          ),
          Text("Nama : $nama"),
          SizedBox(
            height: 20,
          ),
          Text("harga : $harga"),
          SizedBox(
            height: 20,
          ),
          Text("total : $total"),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
