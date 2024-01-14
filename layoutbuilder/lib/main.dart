import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;

    final myAppBar = AppBar(
      title: Text("Layout Builder"),
    );

    final heightBody = heightDevice -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppBar,
      body: Container(
        width: widthDevice,
        height: heightBody * 0.5,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyContainer(widthDevice, heightBody),
            MyContainer(widthDevice, heightBody),
            MyContainer(widthDevice, heightBody),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final double heightBody;
  final double withDevice;
  MyContainer(this.withDevice, this.heightBody);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: withDevice * 0.3,
          height: constraints.maxHeight * 0.5,
          color: Colors.greenAccent,
        );
      },
    );
  }
}
