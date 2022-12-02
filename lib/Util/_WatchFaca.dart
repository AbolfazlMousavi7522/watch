import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class WatchFace extends StatefulWidget {
  const WatchFace({super.key});

  @override
  State<WatchFace> createState() => _WatchFaceState();
}

bool timerOn = false;
int bigAgTimeLeft = 0;
double data1 = 0;
double data = 0;
class _WatchFaceState extends State<WatchFace> {
  @override
  void dispose() {}

  void timerStart(int bigAgTimeInput) {
    var mainTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (bigAgTimeInput > 0 ) {
        setState(() {
          bigAgTimeInput--;
          bigAgTimeLeft = bigAgTimeInput;
          print(bigAgTimeLeft);
        });
      } else {
        timer.cancel();
        timerOn =false;
        print(timerOn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment(0, 0),
          children: [
            GestureDetector(
              onVerticalDragUpdate: (details) {
                data1 == details.primaryDelta ;
                data + data1;
                print(data1);
              },
              onTap: () {
                if (timerOn == false) {
                  timerStart(20);
                  timerOn = true;
                print(timerOn);
                } 
              },
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Image.asset("images/pocket-watchface_01.png"),
              ),
            ),
            AnimatedContainer(
              curve: Curves.bounceInOut,
              duration: Duration(milliseconds: 1000),
              child: RotationTransition(
                turns: new AlwaysStoppedAnimation((bigAgTimeLeft * 6) / 360),
                child: Padding(
                    padding: const EdgeInsets.all(100),
                    child: Image.asset("images/ag_big.png")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(100),
              child: Image.asset("images/ag_smal.png"),
            ),
          Text(data.toString())
          ],
          
        ));
  }
}
