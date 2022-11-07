import 'package:flutter/material.dart';
import 'package:watch/Util/_WatchFaca.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Center(
        child: Stack(alignment: Alignment(0,0),children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Image.asset("images/pocket-watch_back.png"),
          ),
           WatchFace()
        ]),
      ),
    );
  }
}
