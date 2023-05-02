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
  int _framecounter = 0;
  bool _updateLocked = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
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
    _updateLocked = false;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final globalDelta = details.globalPosition.dx - _startingPos;
    //moves to right
    if (_updateLocked == false) {
      if (globalDelta > 0) {
        _animationController.value = 1.0;
        final pos = globalDelta / _screen.width;
        if (pos <= 1.0) return;
        _animationController.value = pos;
      } 
      //moves to left
      else {
        _animationController.value = 0.0;
        final pos = 1 - (globalDelta.abs() / _screen.width);
        if (pos >= 0.0) return;
        _animationController.value = pos;
      }
      _updateLocked = true;
    } else {}
  }

  void _onDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx < 0) {
      {
        _animationController.forward(from: _animationController.value);
        _drawerVisible = true;
        if (_framecounter == 3) {
          _framecounter = 0;
        } else {
          _framecounter += 1;
        }
        setState(() {});
      }
    } else {
      {
        _animationController.reverse(from: _animationController.value);
        _drawerVisible = false;
        if (_framecounter == 0) {
          _framecounter = 3;
        } else {
          _framecounter -= 1;
        }
        setState(() {});
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
              height: MediaQuery.of(context).size.height * 0.528,
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
                    248,
                    fps: 62,
                    isLooping: false,
                    isBoomerang: true,
                    isAutoPlay: false,
                    // frame: (
                    //   _framecounter == 0 ?
                    //   1
                    //   : _framecounter * 62
                    //   ).ceil(),
                    frame: ((_animationController.value + _framecounter) * 62).ceil(),
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
              height: MediaQuery.of(context).size.height * 0.333,
              width: MediaQuery.of(context).size.width,
            ),

        ],
      ),
    );
  }
}