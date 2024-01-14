import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.amber,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Text("Test"),
                Text("Test"),
                Text("Test"),
                Text("Test"),
                Text("Test"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  width: 80,
                  color: Colors.red,
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
