import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String tanggal = "";
  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      cancelText: "Batal",
      confirmText: "Confirm",
      fieldLabelText: "Tanggal",
      // selectableDayPredicate: (day) {
      //   if (day.isAfter(DateTime.now().subtract(Duration(days: 2))) &&
      //       day.isBefore(DateTime.now().add(Duration(days: 2)))) {
      //     return true;
      //   }
      //   return false;
      // },
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        tanggal = picked.toString().substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tanggal,
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              onPressed: () {
                _selectedDate(context);
              },
              child: Text("Tanggal"),
            )
          ],
        ),
      ),
    );
  }
}
