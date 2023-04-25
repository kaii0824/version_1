//Import Flutter libraries:
import 'package:flutter/material.dart';

//========================================================================
//This file contains the function that builds the "Settings"-Screen
//
//For MediaQuery read discription at welcome_screen.dart
//========================================================================

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
            ),

            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: const FittedBox(
                    child: Text(
                      "Settings",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.88,
              width: MediaQuery.of(context).size.width,
            ),

        ],
      ),
    );
  }
}