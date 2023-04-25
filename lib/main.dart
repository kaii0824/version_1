// Flutter Libraries that are imported in this file are listed here:
import 'package:flutter/material.dart';

// Other Files of this Project that are imported in this file are listed here:
import 'package:version_1/screens/anchor.dart';

//======================================================================
//This is the main function of the whole App.
//The App runs through this function first, that means all data needs to be fetched here (stored data, etc.)
//======================================================================


void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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