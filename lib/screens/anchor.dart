import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'dispenser_info.dart';
import 'settings.dart';
import 'welcome_screen.dart';
import 'bluetooth_connect_page.dart';

class Anchor extends StatefulWidget {
  final FlutterBlue flutterBlue;

  const Anchor({required this.flutterBlue, Key? key}) : super(key: key);

  @override
  State<Anchor> createState() => _AnchorState();
}

class _AnchorState extends State<Anchor> {
  final PageController _controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        // ignore: prefer_const_constructors
        DispenserInfo(),
        // ignore: prefer_const_constructors
        StartScreen(),
        // ignore: prefer_const_constructors
        Settings(),
        BluetoothConnectPage(flutterBlue: widget.flutterBlue),
      ],
    );
  }
}
