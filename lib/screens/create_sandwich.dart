///Import flutter libraries:
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

///Import other files:
import 'package:version_1/globals.dart';

///====================================================
///This displays the UI where the user can create the sandwich.
///====================================================


class CreateSandwich extends StatefulWidget {
  const CreateSandwich({super.key});

  @override
  State<CreateSandwich> createState() => _CreateSandwichState();
}

class _CreateSandwichState extends State<CreateSandwich> {

  ///function that opens a small window where the user can input the time that should pass, until the sandwich is made
  setTime() {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (context, SBsetState) {
              return Column(
                 mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Prepare in:",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: MediaQuery.of(context).size.height * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        ///Hours
                        NumberPicker(
                          minValue: 00,
                          maxValue: 23,
                          value: 0,
                          onChanged: (value) {
                            setState(() {});
                            SBsetState(
                              () {},
                            );
                          }),

                        ///Minutes
                        NumberPicker(
                          minValue: 00,
                          maxValue: 60,
                          value: 0,
                          onChanged: (value) {
                            setState(() {});
                            SBsetState(
                              () {},
                            );
                          }),
                      ]
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Hours / Week'),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {}, 
                          child: const Text('save')
                        )
                      ],
                    )
                  ]
              );
            },
          ),
        );
      }
    );
  }



  ///function that builds the main structure:
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

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: const FittedBox(
                child: Text(
                  "New Sandwich",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              ),
            ),

            //0.88 downwards

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.width,
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.001,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.black87,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.004,
              width: MediaQuery.of(context).size.width,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.height * 0.9,
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.001),
                child: Center(
                  child: ListView.builder(
                    itemCount: dispenserIngredients.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return DispenserIngredientsUI(index_: index,);
                    })
                  ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.466,
              width: MediaQuery.of(context).size.width,
              child: DragTarget<String>(
                builder: (BuildContext context, List<dynamic> accepted,List<dynamic> rejected) {
                  return const Placeholder();
                }
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.001,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.black87,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.001),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Prepare for:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: (){setTime();},
                      child: const Text(
                        '19:30',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
                child: const Icon(
                  Icons.star_border_outlined,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                  child: const FittedBox(
                    child: Text(
                      "Make it a favourite",
                      style: TextStyle(
                          color: Colors.black87,
                      ),
                    ),
                  )),
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.134,
              width: MediaQuery.of(context).size.width,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.5,
              child: FittedBox(
                child: ElevatedButton(
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black87),
                        ),
                  child: const Text(
                    "Make my Sandwich",
                    style: TextStyle(
                      color: Colors.black87
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
              width: MediaQuery.of(context).size.width,
            )
        ],
      ),
    );
  }
}


class DispenserIngredientsUI extends StatelessWidget {
  const DispenserIngredientsUI({super.key, required this.index_});

  final int index_;

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      maxSimultaneousDrags: 1,
      data: '',


      feedback: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.18,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.black87),
          ),
          child: Center(
            child: Text(
              dispenserIngredients[index_],
              style: TextStyle(
                color: Colors.black87,
                fontSize: MediaQuery.of(context).size.height * 0.01,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
      ),

      childWhenDragging: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.18,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.black87),
          ),
          child: Center(
            child: Text(
              dispenserIngredients[index_],
              style: TextStyle(
                color: Colors.black87,
                fontSize: MediaQuery.of(context).size.height * 0.01,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
      ),

      child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.18,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.black87),
          ),
          child: Center(
            child: Text(
              dispenserIngredients[index_],
              style: TextStyle(
                color: Colors.black87,
                fontSize: MediaQuery.of(context).size.height * 0.01,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
    );
  }
}