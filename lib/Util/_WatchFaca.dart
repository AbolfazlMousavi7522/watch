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

class _WatchFaceState extends State<WatchFace> {
  @override
  void dispose() {}

  void timerStart(int bigAgTimeLeft) {
    var mainTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (bigAgTimeLeft < 20) {
        timerOn == true;
        setState(() {
          bigAgTimeLeft--;
          print(bigAgTimeLeft);
        });
      } else {
        timer.cancel();
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
                print(details.localPosition.dy);
              },
              onTap: () {
                if (timerOn == false) {
                  timerStart();
                  timerOn = true;
                } else {
                  bigAgTimeLeft = 0;
                  timerOn = false;
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
          ],
        ));
  }
}
