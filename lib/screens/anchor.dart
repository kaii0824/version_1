//Import the flutter libraries:
import 'package:flutter/material.dart';

//Import other files:
import 'package:version_1/screens/settings.dart';
import 'package:version_1/screens/dispenser_info.dart';
import 'package:version_1/screens/welcome_screen.dart';

//=================================================================
//Anchor is the anchor for the three front pages
//This function is responsible that one can swipe through the three screens and navigate to all the other screens of the app
//=================================================================

class Anchor extends StatefulWidget {
  const Anchor({super.key});

  @override
  State<Anchor> createState() => _AnchorState();
}

class _AnchorState extends State<Anchor> {
  final PageController _controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: const [
        DispenserInfo(),
        StartScreen(),
        Settings(), 
      ],
    );
  }
}