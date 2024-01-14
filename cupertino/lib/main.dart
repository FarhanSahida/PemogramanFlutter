import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //   showDialog(
            //     context: context,
            //     builder: (context) {
            //       return Platform.isIOS
            //           ? CupertinoAlertDialog(
            //               title: Text("DELETE"),
            //               content: Text("Are you sure to delete this?"),
            //               actions: [
            //                 TextButton(
            //                   onPressed: () {
            //                     Navigator.of(context).pop();
            //                   },
            //                   child: Text("cancel"),
            //                 ),
            //                 TextButton(
            //                   onPressed: () {},
            //                   child: Text("Oke"),
            //                 )
            //               ],
            //             )
            //           : AlertDialog(
            //               title: Text("DELETE"),
            //               content: Text("Are you sure to delete this?"),
            //               actions: [
            //                 TextButton(
            //                   onPressed: () {
            //                     Navigator.of(context).pop();
            //                   },
            //                   child: Text("cancel"),
            //                 ),
            //                 TextButton(
            //                   onPressed: () {},
            //                   child: Text("Oke"),
            //                 )
            //               ],
            //             );
            //     },
            //   );
            Platform.isAndroid
                ? showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2003),
                    lastDate: DateTime(2050),
                    onDatePickerModeChange: (value) {
                      print(value);
                    },
                  )
                : showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoDatePicker(
                        onDateTimeChanged: (datetime) {
                          print(datetime);
                        },
                        initialDateTime: DateTime.now(),
                      );
                    },
                  );
          },
          child: Text("Tanggal"),
        ),
      ),
    );
  }
}
