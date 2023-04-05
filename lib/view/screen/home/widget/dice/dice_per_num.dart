import 'package:flutter/material.dart';

import 'dice_dot.dart';

class DicePerNum extends StatelessWidget {
  final int no;
  const DicePerNum(this.no, {super.key});

  @override
  Widget build(BuildContext context) {
    switch (no) {
      case 1:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 22.5,
              width: 22.5,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.all(7),
          child: Stack(
            children: const [
              DiceDot(alignment: Alignment.topRight),
              DiceDot(alignment: Alignment.bottomLeft),
            ],
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.all(7),
          child: Stack(
            children: const [
              DiceDot(alignment: Alignment.topRight),
              DiceDot(alignment: Alignment.center),
              DiceDot(alignment: Alignment.bottomLeft),
            ],
          ),
        );
      case 4:
        return Padding(
          padding: const EdgeInsets.all(7),
          child: Stack(
            children: const [
              DiceDot(alignment: Alignment.topLeft),
              DiceDot(alignment: Alignment.topRight),
              DiceDot(alignment: Alignment.bottomLeft),
              DiceDot(alignment: Alignment.bottomRight),
            ],
          ),
        );
      case 5:
        return Padding(
          padding: const EdgeInsets.all(7),
          child: Stack(
            children: const [
              DiceDot(alignment: Alignment.topLeft),
              DiceDot(alignment: Alignment.topRight),
              DiceDot(alignment: Alignment.center),
              DiceDot(alignment: Alignment.bottomLeft),
              DiceDot(alignment: Alignment.bottomRight),
            ],
          ),
        );
      case 6:
        return Padding(
          padding: const EdgeInsets.all(7),
          child: Stack(
            children: const [
              DiceDot(alignment: Alignment.topLeft),
              DiceDot(alignment: Alignment.topCenter),
              DiceDot(alignment: Alignment.topRight),
              DiceDot(alignment: Alignment.bottomLeft),
              DiceDot(alignment: Alignment.bottomCenter),
              DiceDot(alignment: Alignment.bottomRight),
            ],
          ),
        );
      default:
        return Column();
    }
  }
}