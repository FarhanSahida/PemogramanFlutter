import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Images'),
          ),
        ),
        body: Center(
          child: Container(
              width: 400,
              height: 400,
              color: Colors.orange,
              child: Image.asset(
                "images/OOP.jpg",
                fit: BoxFit.cover,
              )
              // Image(
              //   fit: BoxFit.cover,
              //   image: AssetImage("images/ssRaiden.png"),
              //   // image: NetworkImage("https://picsum.photos/400/400"),
              // ),
              ),
        ),
      ),
    );
  }
}
