//Import Flutter libraries:
import 'package:flutter/material.dart';
//Import Flutter Blue libraries;
//import 'package:flutter_blue/flutter_blue.dart';

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

          ///0.88

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
            width: MediaQuery.of(context).size.width,
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.001,
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.black87,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
            width: MediaQuery.of(context).size.width,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                    child: const FittedBox(
                      child: Text(
                        "Bluetooth",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    )),
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.41,
            width: MediaQuery.of(context).size.width,
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.001,
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.black87,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
            width: MediaQuery.of(context).size.width,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                    child: const FittedBox(
                      child: Text(
                        "Alerts",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    )),
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.402,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
