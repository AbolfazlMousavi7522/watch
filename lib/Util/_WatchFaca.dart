import 'package:flutter/material.dart';

class WatchFace extends StatefulWidget {
  const WatchFace({super.key});

  @override
  State<WatchFace> createState() => _WatchFaceState();
}

class _WatchFaceState extends State<WatchFace> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(alignment: Alignment(0,0),
      children: [
        Image.asset("images/pocket-watchface_01.png"),
        Padding(
          padding: const EdgeInsets.only(top: 105, right: 10, left: 10),
          child: Padding(
            padding: const EdgeInsets.all(80),
            child: Image.asset("images/ag_big.png"),
          ),
        )
      ],
    ));
  }
}
