// @dart=2.9

// Flutter Libraries that are imported in this file are listed here:
import 'package:flutter/material.dart';

// Other Files of this Project that are imported in this file are listed here:
import 'package:version_1/screens/anchor.dart';

//======================================================================
//This is the main function of the whole App.
//The App runs through this function first, that means all data needs to be fetched here (stored data, etc.)
//======================================================================
import 'package:flutter_blue/flutter_blue.dart';
import 'package:version_1/screens/bluetooth_connect_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandi SM-1200',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anchor(),
    );
  }
}
