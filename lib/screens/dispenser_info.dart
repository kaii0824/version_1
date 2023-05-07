//Import Flutter libraries:
import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';

//Import other files:

//================================================================
//DispenserInfo is the function for the screen that shows the dispenser information.
//The user can see all information about the fill-level, what´s in the dispensers and so on
//================================================================

class DispenserInfo extends StatefulWidget {
  const DispenserInfo({super.key});

  @override
  State<DispenserInfo> createState() => _DispenserInfoState();
}

class _DispenserInfoState extends State<DispenserInfo> with TickerProviderStateMixin{

  List<ImageProvider> imageList = [];

  bool imagePrecached = false;


  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_) {loadImages(); });
    super.initState();
  }

  ///It would be best to load the entire list when the app is launching. 
  void loadImages() async {
    for (int i = 1; i <= 250; i++) {
      imageList.add(AssetImage('assets/dispenserSequence/$i.png'));
      await precacheImage(AssetImage('assets/dispenserSequence/$i.png'), context);
    }
    setState(() {imagePrecached = true;});
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

              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.height * 0.4,
                  child: FittedBox(
                    child: imagePrecached == true 
                    ? ImageView360(
                        key: UniqueKey(),
                        imageList: imageList,
                        autoRotate: false,
                        frameChangeDuration: const Duration(milliseconds: 1),
                        swipeSensitivity: 5,
                        rotationDirection: RotationDirection.anticlockwise,
                        allowSwipeToRotate: true,
                      ) 
                    : const SizedBox(),
                  ),
                ),
              )
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