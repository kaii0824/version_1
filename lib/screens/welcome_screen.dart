//Import Flutter libraries:
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' show Vector3;

//Import other Files
import 'package:version_1/globals.dart';

//======================================================================
//This builds the screen that is seen first when the App starts. 
//From here, the user can navigate to every other screen.
//
//In the column every child has a height that is defined with MediaQuery and a number multiplicated with it.
//MediaQuery.of(context).size.height means, that it will use the whole height of the screen. The number that is multiplicated 
//is the percentage that is needed for the widget. That means all the numbers together in one screen must always add up to exactly the
//number 1. Otherwise we will get an Pixel-Overflow-Error.
//The Benefit of this is, that the App adjusts to different Screensizes automatically.
//======================================================================

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with TickerProviderStateMixin{

  late AnimationController _xController;   //controlls x-Axis Animation
  late AnimationController _yController;   //controlls y-Axis Animation
  late AnimationController _zController;   //controlls z-Axis Animation

  late Tween<double> _animation;

  @override
  void initState() { 
    super.initState();

    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20)
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30)
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40)
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _zController
      ..reset()
      ..repeat();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: const FittedBox(
                child: Text(
                  "Sandi SM-1200",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.496,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: AnimatedBuilder(
                  animation: Listenable.merge([
                    _xController,
                    _yController,
                    _zController,
                  ]),
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateX(_animation.evaluate(_xController))
                        ..rotateY(_animation.evaluate(_yController))
                        ..rotateZ(_animation.evaluate(_zController)),
                      child: Stack(
                        children: [
                          //Front
                          Container(
                            height: 80,
                            width: 80,
                            color: Colors.green,
                          ),

                          //top
                          Transform(
                            alignment: Alignment.topCenter,
                            transform: Matrix4.identity()..rotateX(-pi / 2),
                            child: Container(
                              height: 80,
                              width: 80,
                              color: Colors.orange,
                            ),
                          ),

                          //bottom
                          Transform(
                            alignment: Alignment.bottomCenter,
                            transform: Matrix4.identity()..rotateX(pi / 2),
                            child: Container(
                              height: 80,
                              width: 80,
                              color: Colors.brown,
                            ),
                          ),

                          //left
                          Transform(
                            alignment: Alignment.centerLeft,
                            transform: Matrix4.identity()..rotateY(pi / 2),
                            child: Container(
                              height: 80,
                              width: 80,
                              color: Colors.red,
                            ),
                          ),

                          //right
                          Transform(
                            alignment: Alignment.centerRight,
                            transform: Matrix4.identity()..rotateY(-pi / 2),
                            child: Container(
                              height: 80,
                              width: 80,
                              color: Colors.blue,
                            ),
                          ),

                          //Back
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate(Vector3(0, 0, -80)),
                            child: Container(
                              height: 80,
                              width: 80,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.5,
              child: FittedBox(
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: const Text("New Sandwich"),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
              width: MediaQuery.of(context).size.width,
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.001,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.black87,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.325,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: favourites.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Text(
                      favourites[index]
                    ),
                  );
                })
              ),
            ),

        ], 
      ),
    );
  }
}
