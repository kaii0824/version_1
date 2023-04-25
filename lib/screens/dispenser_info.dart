//Import Flutter libraries:
import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

//================================================================
//DispenserInfo is the function for the screen that shows the dispenser information.
//The user can see all information about the fill-level, what´s in the dispensers and so on
//================================================================

class DispenserInfo extends StatefulWidget {
  const DispenserInfo({super.key});

  @override
  State<DispenserInfo> createState() => _DispenserInfoState();
}

class _DispenserInfoState extends State<DispenserInfo> with SingleTickerProviderStateMixin{

  var _maxSlide = 0.75;
  var _extraHeight = 0.1;
  late double _startingPos;
  var _drawerVisible = false;
  late AnimationController _animationController;
  Size _screen = Size(0, 0);
  late CurvedAnimation _animator;
  late CurvedAnimation _objAnimator;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animator = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutQuad,
      reverseCurve: Curves.easeInQuad,
    );
    _objAnimator = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void didChangeDependencies() {
    _screen = MediaQuery.of(context).size;
    _maxSlide *= _screen.width;
    _extraHeight *= _screen.height;
    super.didChangeDependencies();
  }

  void _onDragStart(DragStartDetails details) {
    _startingPos = details.globalPosition.dx;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final globalDelta = details.globalPosition.dx - _startingPos;
    if (globalDelta > 0) {
      final pos = globalDelta / _screen.width;
      if (_drawerVisible && pos <= 1.0) return;
      _animationController.value = pos;
    } else {
      final pos = 1 - (globalDelta.abs() / _screen.width);
      if (!_drawerVisible && pos >= 0.0) return;
      _animationController.value = pos;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
      if (details.velocity.pixelsPerSecond.dx < 0) {
        _animationController.forward(from: _animationController.value);
        _drawerVisible = true;
      } else {
        _animationController.reverse(from: _animationController.value);
        _drawerVisible = false;
      }
      return;
    }
    if (_animationController.value < 0.5) {
      {
        _animationController.forward(from: _animationController.value);
        _drawerVisible = true;
      }
    } else {
      {
        _animationController.reverse(from: _animationController.value);
        _drawerVisible = false;
      }
    }
  }

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: const FittedBox(
                    child: Text(
                      "Dispenser",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              )
            ],
          ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.536,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onHorizontalDragStart: _onDragStart,
                onHorizontalDragUpdate: _onDragUpdate,
                onHorizontalDragEnd: _onDragEnd,
                child: AnimatedBuilder(
                  animation: _objAnimator,
                  builder: (_, __) => ImageSequenceAnimator(
                    "assets/dispenserSequence",
                    "",
                    1,
                    4,
                    "png",
                    250,
                    fps: 60,
                    isLooping: false,
                    isBoomerang: true,
                    isAutoPlay: false,
                    frame: (_objAnimator.value * 62).ceil(),
                  ),
                ),
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.001,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.black87,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.325,
              width: MediaQuery.of(context).size.width,
            ),

        ],
      ),
    );
  }
}