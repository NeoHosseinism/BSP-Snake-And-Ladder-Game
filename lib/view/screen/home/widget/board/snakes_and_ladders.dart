import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../../../global.dart';
import '../../../../../model/player/player.dart';
import '../../../../painter/arrow.dart';
import '../../../../painter/player_token.dart';

class SnakesAndLadders extends StatelessWidget {
  const SnakesAndLadders({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 1), () {
        setAHomeSize();
        // for (int i = 0; i < keys.length; i++) {
        //   homesOffset.value.add([
        //     getOffsetOfHome(keys[i])[0],
        //     getOffsetOfHome(keys[i])[1],
        //   ]);
        //   print(getOffsetOfHome(keys[i])[0].toString());
        // }
      }),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Visibility(
            visible: true,
            child: Center(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.brown[400],
                  ),
                  child: const CircularProgressIndicator(color: Colors.white)),
            ),
          );
        } else {
          return Visibility(
            visible: true,
            child: Stack(
              children: [
                // 92 - 4
                CustomPaint(
                  painter: ArrowPainter(
                    startX: getOffsetOfHome(keys[98])[0],
                    startY: getOffsetOfHome(keys[98])[1],
                    endX: getOffsetOfHome(keys[3])[0],
                    endY: getOffsetOfHome(keys[3])[1],
                    arrowSize: halfOfAHomeWidth / 1.75,
                    color: Colors.red,
                  ),
                ),
                // 67 - 6
                CustomPaint(
                  painter: ArrowPainter(
                    startX: getOffsetOfHome(keys[66])[0],
                    startY: getOffsetOfHome(keys[66])[1],
                    endX: getOffsetOfHome(keys[5])[0],
                    endY: getOffsetOfHome(keys[5])[1],
                    arrowSize: halfOfAHomeWidth / 1.75,
                    color: Colors.red,
                  ),
                ),
                // 83 - 40
                CustomPaint(
                  painter: ArrowPainter(
                    startX: getOffsetOfHome(keys[82])[0],
                    startY: getOffsetOfHome(keys[82])[1],
                    endX: getOffsetOfHome(keys[30])[0],
                    endY: getOffsetOfHome(keys[30])[1],
                    arrowSize: halfOfAHomeWidth / 1.75,
                    color: Colors.red,
                  ),
                ),
                // 23 - 59
                CustomPaint(
                  painter: ArrowPainter(
                    startX: getOffsetOfHome(keys[22])[0],
                    startY: getOffsetOfHome(keys[22])[1],
                    endX: getOffsetOfHome(keys[51])[0],
                    endY: getOffsetOfHome(keys[51])[1],
                    arrowSize: halfOfAHomeWidth / 1.75,
                    color: Colors.green,
                  ),
                ),
                // 44 - 94
                CustomPaint(
                  painter: ArrowPainter(
                    startX: getOffsetOfHome(keys[43])[0],
                    startY: getOffsetOfHome(keys[43])[1],
                    endX: getOffsetOfHome(keys[96])[0],
                    endY: getOffsetOfHome(keys[96])[1],
                    arrowSize: halfOfAHomeWidth / 1.75,
                    color: Colors.green,
                  ),
                ),
                // 9 - 53
                CustomPaint(
                  painter: ArrowPainter(
                    startX: getOffsetOfHome(keys[8])[0],
                    startY: getOffsetOfHome(keys[8])[1],
                    endX: getOffsetOfHome(keys[57])[0],
                    endY: getOffsetOfHome(keys[57])[1],
                    // endY: homesOffset[57].dy,
                    arrowSize: halfOfAHomeWidth / 1.75,
                    color: Colors.green,
                  ),
                ),
                // for (Player element in players
                //     .where((element) => element.homeNo != -1)
                //     .toList())
                // CustomPaint(
                //   painter: PlayerTokenPainter(
                //     x: getOffsetOfHome(keys[element.homeNo])[0],
                //     y: getOffsetOfHome(keys[element.homeNo])[1],
                //     color: element.color,
                //   ),
                // ),
              ],
            ),
          );
        }
      },
    );
  }

  void setAHomeSize() {
    final size = keys[0].currentContext!.size;
    if (size != null) {
      halfOfAHomeWidth = size.width / 2;
    }

    // for (int i = 0; i < 100; i++) {
    //   homesOffset[i] = Offset(
    //     getOffsetOfHome(keys[i])[0],
    //     getOffsetOfHome(keys[i])[1],
    //   );
    //   print("${homesOffset[i].dx.toString()}, ${homesOffset[i].dx.toString()}");
    // }
  }
}
